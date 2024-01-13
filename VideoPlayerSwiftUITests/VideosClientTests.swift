//
//  VideosClientTests.swift
//  VideoPlayerSwiftUITests
//
//  Created by Tibin Thomas on 2024-01-12.
//

import XCTest
@testable import VideoPlayerSwiftUI

final class VideosClientTests: XCTestCase {
    func testVideosDataFetch() async throws {
        // given
        let client =  VideosClient()
        // when
        let videos = try await client.getVideos()
        // then
        XCTAssert(videos?.count ?? 0 > 0)
    }
}
