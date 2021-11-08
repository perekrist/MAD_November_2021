//
//  VideoViewModel.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI
import WebKit

class VideoViewModel: NSObject, ObservableObject, WKNavigationDelegate {
  let request = "https://learnenglish.britishcouncil.org/general-english/video-zone"
  
  
  func webView(_ webView: WKWebView,
               decidePolicyFor navigationAction: WKNavigationAction,
               decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    if navigationAction.request.url?.absoluteString.contains("video-zone") == true {
      decisionHandler(.allow)
    } else {
      decisionHandler(.cancel)
    }
  }
  
}
