//
//  QuestionViewModel.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

class QuestionViewModel: ObservableObject {
  @Published var questions: [Question] = []
  var correctAnswers: Int {
    return questions.filter { $0.isCorrect }.count
  }
  var incorrectAnswers: Int {
    return questions.count - correctAnswers
  }
  @Published var question: Question?
  @Published var currentQuestion: Int = 0 {
    didSet {
      question = questions[currentQuestion]
      secondsLeftForQuestion = 0.0
    }
  }
  @Published var secondsLeftForQuestion = 5.0 {
    didSet {
      if secondsLeftForQuestion <= 0.0 {
        currentQuestion += 1
      }
    }
  }
  
  init() {
    loadQuestions()
  }
  
  func answer(_ answer: Int) {
    if answer == question?.correctAnswer {
      questions[currentQuestion].isCorrect = true
    }
    currentQuestion += 1
    secondsLeftForQuestion = 5.0
  }
  
  func loadQuestions() {
    questions = Array(repeating: Question(meaning: "The practice or skill of preparing food by combining, mixing, and heating ingredients.",
                                          answers: ["Cooking", "Smiling", "Freezing"].shuffled(),
                                          correctAnswer: 3),
                      count: 1)
    question = questions[0]
  }
}
