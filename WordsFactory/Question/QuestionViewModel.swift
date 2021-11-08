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
      if currentQuestion + 1 < questions.count {
        question = questions[currentQuestion]
      }
      secondsLeftForQuestion = 0.0
    }
  }
  @Published var secondsLeftForQuestion = 5.0 {
    didSet {
      if secondsLeftForQuestion <= 0.0 {
        currentQuestion += 1
        secondsLeftForQuestion = 5.0
      }
    }
  }
  @Published var finish: Bool = false
  
  private let testsFacade = TestsFacade()
  
  init() {
    loadQuestions()
  }
  
  func repeatTrain() {
    finish = false
    loadQuestions()
  }
  
  func answer(_ answer: Int) {
    if answer + 1 == questions[currentQuestion].correctAnswer {
      questions[currentQuestion].isCorrect = true
    }
    if currentQuestion + 1 < questions.count {
      currentQuestion += 1
    }
    if currentQuestion + 1 == questions.count {
      finish = true
    }
  }
  
  func loadQuestions() {
    questions = testsFacade.getQuestions()
    question = questions[0]
  }
}
