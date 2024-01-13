//
//  AppEndPoint.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-12.
//

import Foundation

enum AppEndPoint: URLEndpoint {
    case videos
}

extension AppEndPoint {

    var path: String {
        switch self {

        case .videos:
            return "/videos"
        }
    }
}
