//
//  TrainingView.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

struct TrainingView: View {
  @ObservedObject private var viewModel = TrainingViewModel()
  private let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
  
  var body: some View {
    VStack {
      if viewModel.trainIsStarted {
        VStack {
          ZStack(alignment: .center) {
            Text(viewModel.getState().rawValue)
              .foregroundColor(.black)
              .font(.bold(70))
            
            Circle()
              .trim(from: 0.0, to: CGFloat(viewModel.secondsLeft)/6.0)
              .stroke(viewModel.getState().color, lineWidth: 30)
              .rotationEffect(Angle(degrees: 270))
              .frame(width: 300, height: 300)
          }
          
          Spacer()
          
          Text(viewModel.getState().rawValue)
            .font(.bold(56))
            .foregroundColor(viewModel.getState().color)
        }.frame(maxHeight: 500)
      } else {
        VStack {
          Text("There are \(viewModel.wordsCount) words \nin your Dictionary. \n\nStart the Training?")
            .multilineTextAlignment(.center)
            .font(.medium(24))
            .foregroundColor(.inc)
          
          Spacer()
          
          Button {
            viewModel.startTrain()
          } label: {
            Text("Start")
              .foregroundColor(.white)
              .font(.medium(16))
              .padding(.vertical, 16)
              .padding(.horizontal, 32)
              .frame(maxWidth: .infinity)
              .background(Color.accent)
              .cornerRadius(16)
          }.padding(.horizontal, 32)
        }.frame(maxHeight: 500)
      }
    }.onReceive(timer) { _ in
      if viewModel.trainIsStarted {
        viewModel.secondsLeft -= 1
      }
    }
    .background(
      NavigationLink(isActive: $viewModel.goToTrain,
                     destination: {
                       QuestionView()
                     }, label: {
                       EmptyView()
                     })
        .hidden()
    )
  }
}
