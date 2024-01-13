//
//  SOVideo.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-12.
//

// MARK: - Video

struct SOVideo: Codable, Equatable {

    static func == (lhs: SOVideo, rhs: SOVideo) -> Bool {
        lhs.id == rhs.id
    }

    let id: String
    let title: String
    let hlsURL: String
    let fullURL: String
    let description: String
    let publishedAt: String
    let author: Author
}

// MARK: - Author
struct Author: Codable {
    let id: String
    let name: String
}
