//
//  NetworkManager.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 08.11.2021.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
  let monitor = NWPathMonitor()
  let queue = DispatchQueue(label: "NetworkManager")
  @Published var isConnected = true
  
  private let localStorage = LocalStorageService()
  private let remoteStorage = NetworkService()
  
  init() {
    monitor.pathUpdateHandler = { path in
      DispatchQueue.main.async {
        self.isConnected = path.status == .satisfied
      }
    }
    monitor.start(queue: queue)
  }
  
  func search(with text: String, completion: @escaping (([Word]) -> Void)) {
    let storage: Searchable = isConnected ? remoteStorage : localStorage
    storage.search(with: text) { words in
      completion(words)
    }
  }
}
