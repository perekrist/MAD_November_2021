//
//  QuestionView.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

struct QuestionView: View {
  @ObservedObject private var viewModel = QuestionViewModel()
  private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    VStack {
      Text("\(viewModel.currentQuestion) of \(viewModel.questions.count)")
        .foregroundColor(.incGray)
        .font(.regular(16))
      Text(viewModel.question?.meaning ?? "")
        .foregroundColor(.inc)
        .multilineTextAlignment(.center)
        .font(.medium(24))
        .padding(.top, 8)
        .padding(16)
      
      VStack(spacing: 16) {
        ForEach(0..<(viewModel.question?.answers.count ?? 0)) { index in
          Button {
            viewModel.answer(index + 1)
          } label: {
            Text("\((viewModel.question?.answers ?? [])[index])")
              .frame(maxWidth: .infinity)
              .padding(.vertical, 16)
              .padding(.horizontal, 24)
              .foregroundColor(Color.incGray)
              .overlay(
                RoundedRectangle(cornerRadius: 8)
                  .stroke(Color.incGray, lineWidth: 1)
              )
          }
        }
      }.padding(.vertical, 24)
        .padding(.horizontal, 16)
      Spacer()
      ZStack(alignment: .leading) {
        Capsule()
          .frame(width: UIScreen.main.bounds.width - 32, height: 5, alignment: .leading)
          .foregroundColor(.incGray)
        
        Capsule()
          .frame(width: (CGFloat(UIScreen.main.bounds.width - 32.0) / 5.0) * viewModel.secondsLeftForQuestion,
                 height: 5, alignment: .leading)
          .background(LinearGradient(colors: [.red, .yellow],
                                     startPoint: .leading, endPoint: .trailing))
      }
    }.onReceive(timer) { _ in
      viewModel.secondsLeftForQuestion -= 0.1
    }
  }
}
