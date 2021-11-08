//
//  SignUpViewModel.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
  @Published var name: String = "test"
  @Published var email: String = "test"
  @Published var password: String = "test"
  @Published var isPasswordSecret: Bool = false
  @Published var goToMain: Bool = false
  
  func signUp() {
    if isFieldsValid() {
      goToMain = true
    }
  }
  
  func hidePassword() {
    isPasswordSecret = true
  }
  
  func showPassword() {
    isPasswordSecret = false
  }
  
  private func isFieldsValid() -> Bool {
    if name.isEmpty || email.isEmpty || password.isEmpty {
      BannerShowingSingleton.shared.showErrorBanner("Fill all fields!")
      return false
    }
    return true
  }
}
