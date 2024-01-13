//
//  VideoService.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-13.
//

protocol VideosService {
    func getVideos() async throws -> [SOVideo]?
}
