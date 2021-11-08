//
//  NetworkService.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import Foundation
import Alamofire

extension NetworkService: Searchable {
  func search(with text: String, completion: @escaping (([Word]) -> Void)) {
    baseRequest(url: text, method: .get) { response in
      completion(response)
    }
  }
}

class NetworkService {
  static let baseURL = "https://api.dictionaryapi.dev/api/v2/entries/en/"
  
  func baseRequest<T: Decodable>(url: String, method: HTTPMethod, completion: @escaping ((T) -> Void)) {
    AF.request(NetworkService.baseURL + url, method: method).responseData { response in
      switch response.result {
      case .success(let data):
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode(T.self, from: data)
          completion(decodedData)
        } catch (let error) {
          BannerShowingSingleton.shared.showErrorBanner("catch:" + error.localizedDescription)
        }
      case .failure(let error):
        BannerShowingSingleton.shared.showErrorBanner(error.localizedDescription)
      }
    }
  }
}
