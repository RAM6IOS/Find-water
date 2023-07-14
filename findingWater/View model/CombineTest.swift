//
//  CombineTest.swift
//  findingWater
//
//  Created by Ramzi Bouchedoub on 13/7/2023.
//


import Foundation
import Combine
class ContentViewModel: ObservableObject {
    @Published var name = ""
    @Published var nameMessage = ""
    init () {
    }
}

struct NameAvailableMessage: Codable {
  var isAvailable: Bool
  var name: String
}
enum NetworkError: Error {
  case invalidRequestError(String)
  case transportError(Error)
  case serverError(statusCode: Int)
  case noData
  case decodingError(Error)
  case encodingError(Error)
}
struct NetworkService {
    func checkNameAvailable(name: String) -> AnyPublisher<Bool, Never> {
        guard let url = URL(string: "http://127.0.0.1:8080/isNameValid?name=\(name)") else {
          return Just(false).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
          .map(\.data)
          .decode(type: NameAvailableMessage.self,
                  decoder: JSONDecoder())
          .map(\.isAvailable)
          .replaceError(with: false)
          .eraseToAnyPublisher()
      }
}
