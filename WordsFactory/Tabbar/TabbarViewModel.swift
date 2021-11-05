//
//  TabbarViewModel.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

enum Tabs: String, CaseIterable {
  case dictionary, training, video
}

class TabbarViewModel: ObservableObject {
  @Published var currentTab: Tabs = .dictionary
}
