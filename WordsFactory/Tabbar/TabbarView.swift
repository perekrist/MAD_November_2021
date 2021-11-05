//
//  TabbarView.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

struct TabbarView: View {
  @ObservedObject private var viewModel = TabbarViewModel()
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Color.white.edgesIgnoringSafeArea(.all)
      VStack {
        switch viewModel.currentTab {
        case .dictionary:
          DictionaryView()
        case .training:
          TrainingView()
        case .video:
          VideoView()
        }
      }.padding(.bottom, 100)
      HStack(spacing: 65) {
        ForEach(Tabs.allCases, id: \.self) { tab in
          VStack {
            Image(tab.rawValue)
            Text(tab.rawValue)
              .font(.regular(14))
          }.foregroundColor(viewModel.currentTab == tab ? .accent : .incGray)
            .onTapGesture {
              viewModel.currentTab = tab
            }
        }
      }.padding(.top, 12)
        .padding([.horizontal, .bottom], 25)
        .frame(maxWidth: .infinity)
        .overlay(
          Rounded()
            .stroke(Color.incGray, lineWidth: 1)
        )
    }.navigationBarHidden(true)
      .edgesIgnoringSafeArea(.bottom)
  }
}
