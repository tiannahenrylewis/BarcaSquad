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

    func fetchPlayerList(completion: @escaping (Result<Response, APIError>) -> Void) {
        let path = "players"
        let url = baseURL.appendingPathComponent(path)
        let request = URLRequest(url: url)
        perform(request: request) { result in
            switch result {
            case .success(let data):

                //If we got data we now must decode it, done inside a do catch block
                do {
                    let jsonDecoder = JSONDecoder()
                    let object = try jsonDecoder.decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(object))
                    }
                } catch {
                    //RESUME 6:05
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    private func perform(request: URLRequest, completion: @escaping (Result<Data, APIError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkingError(error)))
                return
            }

            guard let http = response as? HTTPURLResponse, let data = data else {
                completion(.failure(.invalidResponse))
                return
            }

            switch http.statusCode {

            case 200:
                completion(.success(data))

            case 400...499:
                let body = String(data: data, encoding: .utf8)
                completion(.failure(.requestError(http.statusCode, body ?? "<no body>")))


            case 500...599:
                completion(.failure(.serverError))


            default:
                fatalError("Unhandled HTTP status code: \(http.statusCode)")
            }
        }
        task.resume()
    }
}

extension FCBarcelonaAPI {
    struct Response : Decodable {
        let players : [Players]
    }

    struct Players : Decodable {
        let fullName: String
    }
}
