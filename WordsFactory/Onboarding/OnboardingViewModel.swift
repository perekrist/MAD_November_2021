//
//  OnboardingViewModel.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
  var isLastPage: Bool {
    return currentPage == 2
  }
  @Published var currentPage: Int = 0
  @Published var goToSignUp: Bool = false
  @Published var onboardingData: [(String, String)] = [
    ("Learn anytime \nand anywhere", "Quarantine is the perfect time to spend your day learning something new, from anywhere!"),
    ("Find a course \nfor you", "Quarantine is the perfect time to spend your day learning something new, from anywhere!"),
    ("\nImprove your skills", "Quarantine is the perfect time to spend your day learning something new, from anywhere!")]
  
  func skip() {
    goToSignUp = true
  }
  
  func makeAction() {
    if currentPage < 2 {
      currentPage += 1
    } else {
      goToSignUp = true
    }
  }
}

