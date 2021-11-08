//
//  SecondState.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

enum SecondState: String {
  case five = "5", four = "4", three = "3", two = "2", one = "1", go = "GO!"
  
  var color: Color {
    switch self {
    case .five:
      return .accent
    case .four:
      return .lightBlue
    case .three:
      return .green
    case .two:
      return .yellow
    case .one:
      return .red
    case .go:
      return .accent
    }
  }
}
