//
//  HttpClient.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-12.
//

import Foundation

let validStatus = 200...299

protocol HttpClient {
    func fetchHttpData<T: Decodable>(from: URL, responseType: T.Type) async throws -> T?
}

class NetworkClient: HttpClient {

    static let shared = NetworkClient()

    func fetchHttpData<T: Decodable>(from: URL, responseType: T.Type) async throws -> T? {
        guard let (data, response) = try await URLSession.shared.data(from: from) as? (Data, HTTPURLResponse) else {
            throw APIError.unknown
        }
        print("JSON response : \(response)")
        guard validStatus.contains(response.statusCode) else {
            print(response)
            throw APIError.networkError(response.statusCode)
        }
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch let jsonError as NSError {
            print("JSON decode failed: \(jsonError)")
            throw APIError.parsingError
        }
    }
}
