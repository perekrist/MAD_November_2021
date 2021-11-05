//
//  DictionaryViewModel.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

class DictionaryViewModel: ObservableObject {
  @Published var searchText: String = "rude" {
    didSet {
      showEmptyPlaceholder = searchText.isEmpty
    }
  }
  @Published var showEmptyPlaceholder: Bool = false
  @Published var words: [Word] = []
  
  private let networkService = NetworkService()
  
  func search() {
    networkService.getMeaning(from: searchText) { words in
      self.words = words
    }
  }
  
  func playPhonetic(with url: String) {
    
  }
  
  func addToDictionary() {
    
  }
}
