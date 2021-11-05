//
//  TestsFacade.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import Foundation

class TestsFacade {
  private let localStorageService = LocalStorageService()
  private let answers: [String] = ["Cooking", "Smiling"]
  
  func getQuestions() -> [Question] {
    let questions = localStorageService.getWords().map { word -> Question in
      let index = (0..<2).randomElement() ?? 0
      var qAnswers: [String] = answers
      qAnswers.insert(word.word ?? "", at: index)
      return Question(meaning: word.meanings.first?.definitions.first?.definition ?? "",
                      answers: qAnswers,
                      correctAnswer: index)
    }
    return questions
  }
}
