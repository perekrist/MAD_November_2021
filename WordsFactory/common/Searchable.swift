//
//  Searchable.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 08.11.2021.
//

import Foundation

protocol Searchable {
  func search(with text: String, completion: @escaping (([Word]) -> Void))
}
