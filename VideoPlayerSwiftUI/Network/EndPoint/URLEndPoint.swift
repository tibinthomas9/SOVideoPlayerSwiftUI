//
//  URLEndPoint.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-12.
//

import Foundation

protocol URLEndpoint {
    var scheme: String { get }
    var host: String { get }
    var port: Int { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    func url() -> URL?
}

extension URLEndpoint {
    var scheme: String { return "http" }
    var host: String { return "localhost" }
    var queryItems: [URLQueryItem]? {return nil}

    func url() -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.port = port
        components.path = "\(path)"
        components.queryItems = queryItems
        return components.url
    }
}
