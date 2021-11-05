//
//  SignUpViewModel.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
  @Published var name: String = ""
  @Published var email: String = ""
  @Published var password: String = ""
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
