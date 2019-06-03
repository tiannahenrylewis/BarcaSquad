//
//  FCBarcelonaAPI.swift
//  BarcaSquad
//
//  Created by Tianna Henry-Lewis on 2019-06-02.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import Foundation

enum APIError : Error {
    case networkingError(Error)
    case serverError //HTTP 5xx
    case requestError(Int, String) //HTTP 4xx
    case invalidResponse
}

class FCBarcelonaAPI {
    private let session: URLSession
    private let baseURL = URL(string: "https://pure-bayou-11893.herokuapp.com")!

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchPlayerList(completion: @escaping (Result<Data, APIError>) -> Void) {
        let path = "players"
        let url = baseURL.appendingPathComponent(path)
        let request = URLRequest(url: url)
        perform(request: request, completion: completion)
    }

    private func perform(request: URLRequest, completion: @escaping (Result<Data, APIError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.networkingError(error)))
                }
                return
            }

            guard let http = response as? HTTPURLResponse, let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }

            switch http.statusCode {

            case 200:
                DispatchQueue.main.async {
                    completion(.success(data))
                }

            case 400...499:
                let body = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    completion(.failure(.requestError(http.statusCode, body ?? "<no body>")))
                }

            case 500...599:
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }

            default:
                fatalError("Unhandled HTTP status code: \(http.statusCode)")
            }
        }
        task.resume()
    }

}
