//
//  TrainView.swift
//  WatchWordsFactory WatchKit Extension
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

struct TrainView: View {
  @ObservedObject private var viewModel = TrainViewModel()
  var body: some View {
    VStack {
      if !viewModel.finish {
        Text(viewModel.questions[viewModel.currentQuestion].meaning)
          .foregroundColor(.white.opacity(0.85))
          .font(.medium(12))
          .multilineTextAlignment(.center)
        List(0..<2) { index in
          Text(viewModel.questions[viewModel.currentQuestion].answers[index])
            .foregroundColor(.white.opacity(0.85))
            .font(.regular(14))
            .onTapGesture {
              viewModel.answer(index)
            }
        }
      } else {
        Spacer()
        Text("Correct: \(viewModel.correctAnswers)\nIncorrent: \(viewModel.incorrectAnswers)")
          .font(.regular(14))
          .foregroundColor(.incGray)
          .padding(.bottom, 24)
        
        Button {
          viewModel.repeatTrain()
        } label: {
          Text("Repeat")
        }

      }
    }.navigationBarBackButtonHidden(true)
      .navigationTitle {
        Text(!viewModel.finish ? "\(viewModel.currentQuestion) of \(viewModel.questions.count)" : "Finish")
          .frame(maxWidth: .infinity, alignment: .leading)
          .foregroundColor(.accent)
          .font(.regular(20))
      }
  }
}
