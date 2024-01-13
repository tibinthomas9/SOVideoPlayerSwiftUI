//
//  VideosClient.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-12.
//

import Foundation

protocol VideosService {
    func getVideos() async throws -> [SOVideo]?
}

class VideosClient: VideosService {
    func getVideos() async throws -> [SOVideo]? {
        guard let url =  AppEndPoint.videos.url() else { return nil }
        do {
            if let videos = try await NetworkClient.shared.fetchHttpData(from: url,
                                                                          responseType: [SOVideo]?.self) {
                return videos
            } else { return nil }
        } catch { throw error }
    }
}
