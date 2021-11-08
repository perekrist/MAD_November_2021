//
//  Question.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import Foundation

struct Question {
  let meaning: String
  let answers: [String]
  let correctAnswer: Int
  var isCorrect: Bool = false
}
