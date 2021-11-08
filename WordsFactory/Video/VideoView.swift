//
//  VideoView.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI
import UIKit
import WebKit

struct VideoView: UIViewRepresentable {
  @ObservedObject var viewModel: VideoViewModel
  
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.navigationDelegate = viewModel
    return webView
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    guard let url = URL(string: viewModel.request) else { return }
    uiView.load(URLRequest(url: url))
  }
}
