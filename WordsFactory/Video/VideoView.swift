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
  @ObservedObject private var viewModel = VideoViewModel()
  
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.navigationDelegate = viewModel
    return webView
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString("", baseURL: URL(string: viewModel.request))
    //    uiView.loadRequest(URL(string: request))
  }
}
