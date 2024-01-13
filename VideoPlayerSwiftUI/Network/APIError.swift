//
//  APIError.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-12.
//

import Foundation

enum APIError: Error {
    case parsingError
    case networkError(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .parsingError:
            return NSLocalizedString("parsing Error"
                                     , comment: "")
        case .networkError(let statusCode):
            return NSLocalizedString("Network faced some error with status code \(statusCode)"
                                     , comment: "")
        case .unknown:
            return NSLocalizedString("Sorry, network encountered some unexpected issues",
                                     comment: "")
        }
    }
}
