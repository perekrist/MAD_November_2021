//
//  DictionaryViewModel.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI
import AVKit

class DictionaryViewModel: ObservableObject {
  @Published var searchText: String = "" {
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
  
  private var player: AVPlayer?
  private let localStorageService = LocalStorageService()
  @ObservedObject private var networkManager = NetworkManager()
  
  func search() {
    networkManager.search(with: searchText) { words in
      self.words = words
    }
  }
  
  func playPhonetic(with url: String) {
    guard let url = URL(string: "https:" + url) else { return }
    let item = AVPlayerItem(url: url)
    player = AVPlayer(playerItem: item)
    player?.play()
  }
  
  func addToDictionary() {
    guard let word = words.first else { return }
    localStorageService.saveWord(word: word)
  }
}
