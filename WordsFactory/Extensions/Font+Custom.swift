//
//  Font+Custom.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

extension Font {
  static func bold(_ size: CGFloat) -> Font {
    return Font.custom("Rubik-Bold", size: size)
  }
  static func medium(_ size: CGFloat) -> Font {
    return Font.custom("Rubik-Medium", size: size)
  }
  static func regular(_ size: CGFloat) -> Font {
    return Font.custom("Rubik-Regular", size: size)
  }
}
