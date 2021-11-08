//
//  BannerShowingSingleton.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import Foundation
import NotificationBannerSwift

class BannerShowingSingleton {
  static let shared = BannerShowingSingleton()
  
  func showInfoBanner(_ text: String) {
    showBanner(text, style: .info)
  }
  
  func showErrorBanner(_ text: String) {
    showBanner(text, style: .danger)
  }
  
  private func showBanner(_ text: String, style: BannerStyle) {
    FloatingNotificationBanner(title: text, style: style).show()
  }
}
