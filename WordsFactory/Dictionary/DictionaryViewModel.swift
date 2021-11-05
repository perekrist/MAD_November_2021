//
//  DictionaryViewModel.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI
import AVKit

class DictionaryViewModel: ObservableObject {
  @Published var searchText: String = "rude" {
    didSet {
      showEmptyPlaceholder = searchText.isEmpty || words.isEmpty
    }
  }
  @Published var showEmptyPlaceholder: Bool = true
  @Published var words: [Word] = [] {
    didSet {
      showEmptyPlaceholder = searchText.isEmpty || words.isEmpty
    }
  }
  
  private let networkService = NetworkService()
  private let localStorageService = LocalStorageService()
  
  func search() {
    networkService.getMeaning(from: searchText) { words in
      self.words = words
    }
  }
  
  func playPhonetic(with url: String) {
    guard let url = URL(string: "https:" + url) else { return }
    let item = AVPlayerItem(url: url)
    do {
      let player = try AVPlayer(playerItem: item)
      player.play()
    } catch (let error) {
      BannerShowingSingleton.shared.showErrorBanner(error.localizedDescription)
    }
  }
  
  func addToDictionary() {
    guard let word = words.first else { return }
    localStorageService.saveWord(word: word)
  }
}
