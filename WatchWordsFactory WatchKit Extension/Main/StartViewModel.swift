//
//  StartViewModel.swift
//  WatchWordsFactory WatchKit Extension
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

class StartViewModel: ObservableObject {
  @Published var goToTrain: Bool = false
  @Published var secondsLeft: Int = 6 {
    didSet {
      if secondsLeft == 0 {
        goToTrain = true
      }
    }
  }
  
  func getState() -> SecondState {
    switch secondsLeft {
    case 6:
      return .five
    case 5:
      return .four
    case 4:
      return .three
    case 3:
      return .two
    case 2:
      return .one
    case 1:
      return .go
    default:
      return .go
    }
  }
}
