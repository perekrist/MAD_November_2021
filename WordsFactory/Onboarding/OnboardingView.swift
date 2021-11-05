//
//  OnboardingView.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

struct OnboardingView: View {
  @ObservedObject private var viewModel = OnboardingViewModel()
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Button {
          viewModel.skip()
        } label: {
          Text("Skip")
            .foregroundColor(.inc)
            .font(.medium(14))
        }.padding(16)
      }
      
      Spacer()
      
      TabView {
        ForEach(0..<viewModel.onboardingData.count) { index in
          VStack {
            Image("onb\(index + 1)")
            VStack(spacing: 8) {
              Text(viewModel.onboardingData[index].0)
                .foregroundColor(.inc)
                .font(.medium(24))
                .multilineTextAlignment(.center)
              
              Text(viewModel.onboardingData[index].1)
                .foregroundColor(.incGray)
                .font(.regular(14))
                .multilineTextAlignment(.leading)
            }.padding(.top, 16)
              .padding(.horizontal, 17)
          }
        }
      }.tabViewStyle(.page)
      
      Spacer()
      
      Button {
        viewModel.makeAction()
      } label: {
        Text(viewModel.isLastPage ? "Let’s Start" : "Next")
          .foregroundColor(.white)
          .font(.medium(16))
          .padding(.vertical, 16)
          .padding(.horizontal, 32)
          .frame(maxWidth: .infinity)
          .background(Color.accent)
          .cornerRadius(16)
      }.padding([.horizontal, .bottom], 32)
        .frame(maxHeight: 56)
    }.navigationBarHidden(true)
      .background(
        NavigationLink(isActive: $viewModel.goToSignUp,
                       destination: {
                         SignUpView()
                       }, label: {
                         EmptyView()
                       }).hidden()
      )
  }
}
