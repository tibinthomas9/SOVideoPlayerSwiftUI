//
//  VideosListViewModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-13.
//

import Foundation

@MainActor
class VideosListViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var state = LoadingState.loading
    @Published private(set) var currentVideo: SOVideo?

    private var videos: [SOVideo] = [] {
        didSet {
            updateCurrentVideo()
        }
    }

    private var currentVideoIndex: Int = 0 {
        didSet {
            updateCurrentVideo()
        }
    }

    private let client: VideosService

    // MARK: - Methods

    func getVideos() async {
        do {
            if let allVideos = try await client.getVideos() {
                self.videos = allVideos.sorted { $0.publishedAt.toSOVideoDate() ?? Date() < $1.publishedAt.toSOVideoDate() ?? Date() }
            }
            updateState()
        } catch {
            handleVideoLoadingError(error)
        }
    }

    func nextVideo() {
        self.currentVideoIndex = (currentVideoIndex + 1 < videos.count) ? currentVideoIndex + 1  : 0
    }

    func previousVideo() {
        self.currentVideoIndex = (currentVideoIndex - 1 >= 0) ? currentVideoIndex - 1  : videos.count - 1
    }

    // MARK: - Initializer

    init(client: VideosService = VideosClient()) {
        self.client = client
    }

    // MARK: - Private Methods

    private func updateState() {
        self.state = videos.isEmpty ? .empty : .loaded
    }

    private func handleVideoLoadingError(_ error: Error) {
        self.videos = []
        self.state = .error(error)
    }

    private func updateCurrentVideo() {
        guard currentVideoIndex < videos.count else {
            self.currentVideo = nil
            return
        }
        self.currentVideo = videos[currentVideoIndex]
    }
}
