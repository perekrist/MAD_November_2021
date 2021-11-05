//
//  DictionaryResponse.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import Foundation

struct Word: Codable, Identifiable {
  let id = UUID().uuidString
  let word: String?
  let meanings: [Meaning]
  let phonetics: [Phonetics]
}

struct Meaning: Codable, Identifiable {
  let id = UUID().uuidString
  let partOfSpeech: String?
  let definitions: [Definition]
}

struct Definition: Codable, Identifiable {
  let id = UUID().uuidString
  let definition: String?
  let example: String?
}

struct Phonetics: Codable {
  let text: String?
  let audio: String?
}
