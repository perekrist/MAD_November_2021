//
//  TrainViewModel.swift
//  WatchWordsFactory WatchKit Extension
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

class TrainViewModel: ObservableObject {
  @Published var currentQuestion: Int = 0
  @Published var questions: [Question] = []
  @Published var finish: Bool = false
  @Published var correctAnswers = 0
  @Published var incorrectAnswers = 0
  
  private let testsFacade = TestsFacade()
  
  init() {
    loadQuestions()
  }
  
  func answer(_ index: Int) {
    if index + 1 == questions[currentQuestion].correctAnswer {
      questions[currentQuestion].isCorrect = true
    }
    if currentQuestion + 1 < questions.count {
      currentQuestion += 1
    }
    if currentQuestion + 1 == questions.count {
      finish = true
      correctAnswers = questions.filter { $0.isCorrect }.count
      incorrectAnswers = questions.count - correctAnswers
    }
  }
  
  func repeatTrain() {
    finish = false
    currentQuestion = 0
    loadQuestions()
  }
  
  private func loadQuestions() {
    questions = testsFacade.getQuestions()
  }
}
