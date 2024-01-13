//
//  VideosListViewModelTests.swift
//  VideoPlayerSwiftUITests
//
//  Created by Tibin Thomas on 2024-01-13.
//

import XCTest
@testable import VideoPlayerSwiftUI

@MainActor
final class VideosListViewModelTests: XCTestCase {

    class MockVideosService: VideosService {
        var videos: [SOVideo]?

        func getVideos() async throws -> [SOVideo]? {
            return videos
        }
    }

    var viewModel: VideosListViewModel!
    var mockClient: MockVideosService!

     override func setUpWithError() throws {
        mockClient = MockVideosService()
        viewModel = VideosListViewModel(client: mockClient)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockClient = nil
    }

    // Test getting videos successfully
    func testGetVideosSuccess() async throws {
        // Arrange
        let mockVideos = [SOVideo(id: "1",
                                  title: "Video",
                                  hlsURL: "Description 1",
                                  fullURL: "", description: "",
                                  publishedAt: "", author: Author(id: "1",
                                                                  name: "author 1"))]
        mockClient.videos = mockVideos

        // Act
        await viewModel.getVideos()

        // Assert
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssertEqual(viewModel.currentVideo, mockVideos.first)
    }

    // Test nextVideo and previousVideo methods
    func testNextVideoAndPreviousVideo() async {
        // Arrange
        let mockVideos = [
            SOVideo(id: "1",
                    title: "Video",
                    hlsURL: "Description 1",
                    fullURL: "", description: "",
                    publishedAt: "2016-12-14T21:09:00.000Z",
                    author: Author(id: "1", name: "author 1")),
            SOVideo(id: "2",
                    title: "Video 2",
                    hlsURL: "Description 2",
                    fullURL: "",
                    description: "",
                    publishedAt: "2018-12-14T21:09:00.000Z",
                    author: Author(id: "2", name: "author 2")),
            SOVideo(id: "3",
                    title: "Video 3",
                    hlsURL: "Description 3",
                    fullURL: "",
                    description: "",
                    publishedAt: "2019-12-14T21:09:00.000Z",
                    author: Author(id: "3", name: "author 3"))]

        mockClient.videos = mockVideos
        await viewModel.getVideos()
        XCTAssertEqual(viewModel.currentVideo, mockVideos[0])

        viewModel.nextVideo()
        XCTAssertEqual(viewModel.currentVideo, mockVideos[1])

        viewModel.nextVideo()
        XCTAssertEqual(viewModel.currentVideo, mockVideos[2])

        viewModel.previousVideo()
        XCTAssertEqual(viewModel.currentVideo, mockVideos[1])

        viewModel.previousVideo()
        XCTAssertEqual(viewModel.currentVideo, mockVideos[0])

        viewModel.previousVideo()
        XCTAssertEqual(viewModel.currentVideo, mockVideos[2])

        viewModel.nextVideo()
        XCTAssertEqual(viewModel.currentVideo, mockVideos[0])
    }
}
