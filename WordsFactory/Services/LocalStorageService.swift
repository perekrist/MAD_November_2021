//
//  LocalStorageService.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import Foundation

class LocalStorageService {
  func getWords() -> [Word] {
    guard let data = UserDefaults(suiteName: "group.com.words-factory")?.data(forKey: "words") else { return [] }
    let decoder = JSONDecoder()
    let decodedData: [Word]? = try? decoder.decode([Word].self, from: data)
    return decodedData ?? []
  }
  
  func saveWord(word: Word) {
    var words = getWords()
    if !words.map { $0.word }.contains(word.word) {
      words.append(word)
    }
    let encoder = JSONEncoder()
    let encodedData = try? encoder.encode(words)
    UserDefaults(suiteName: "group.com.words-factory")?.set(encodedData, forKey: "words")
    UserDefaults(suiteName: "group.com.words-factory")?.set(words.count, forKey: "total")
  }
}
