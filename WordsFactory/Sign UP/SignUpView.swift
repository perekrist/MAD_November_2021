//
//  SignUpView.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

struct SignUpView: View {
  @ObservedObject private var viewModel = SignUpViewModel()
  
  var body: some View {
    VStack {
      Image("signup")
        .padding(.horizontal, 16)
      VStack(spacing: 8) {
        Text("Sign up")
          .foregroundColor(.inc)
          .font(.medium(24))
          .multilineTextAlignment(.center)
        
        Text("Create your account")
          .foregroundColor(.incGray)
          .font(.regular(14))
          .multilineTextAlignment(.leading)
      }.padding(.top, 16)
        .padding(.horizontal, 17)
      
      VStack(spacing: 16) {
        TextField("Name", text: $viewModel.name)
          .padding(16)
          .font(.regular(14))
          .foregroundColor(.incGray)
//          .overlay(
//            RoundedRectangle(cornerRadius: 12)
//              .foregroundColor(.incGray)
//          )
        TextField("Name", text: $viewModel.name)
          .padding(16)
          .font(.regular(14))
          .foregroundColor(.incGray)
//          .overlay(
//            RoundedRectangle(cornerRadius: 12)
//              .foregroundColor(.incGray)
//          )
        HStack {
          TextField("Name", text: $viewModel.name)
            .padding(16)
            .font(.regular(14))
            .foregroundColor(.incGray)
          Button {
            viewModel.isPasswordSecret ? viewModel.showPassword() : viewModel.hidePassword()
          } label: {
            Image(viewModel.isPasswordSecret ? "show" : "hide")
              .resizable()
              .frame(width: 24, height: 24)
          }
        }
//        .overlay(
//          RoundedRectangle(cornerRadius: 12)
//            .foregroundColor(.incGray)
//        )
      }.padding(.horizontal, 16)
      
      Button {
        viewModel.signUp()
      } label: {
        Text("Sign up")
          .foregroundColor(.white)
          .font(.medium(16))
          .padding(.vertical, 16)
          .padding(.horizontal, 32)
          .frame(maxWidth: .infinity)
          .background(Color.accent)
          .cornerRadius(16)
      }.padding(.horizontal, 32)
        .padding(.bottom, 70)
        .frame(maxHeight: 56)
      
    }.navigationBarHidden(true)
      .background(
        NavigationLink(isActive: $viewModel.goToMain,
                       destination: {
                         EmptyView()
                       }, label: {
                         EmptyView()
                       }).hidden()
      )
  }
}
