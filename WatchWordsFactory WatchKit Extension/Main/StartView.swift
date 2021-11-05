//
//  StartView.swift
//  WatchWordsFactory WatchKit Extension
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

struct StartView: View {
  @ObservedObject private var viewModel = StartViewModel()
  private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    VStack {
      Text(viewModel.getState().rawValue)
        .foregroundColor(viewModel.getState().color)
        .font(.bold(70))
    }.onReceive(timer) { _ in
      viewModel.secondsLeft -= 1
    }.background(
      NavigationLink(isActive: $viewModel.goToTrain,
                     destination: {
                       TrainView()
                     }, label: {
                       EmptyView()
                     }).hidden()
    ).navigationTitle {
      Text("Start")
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.accent)
        .font(.regular(20))
    }
  }
}
