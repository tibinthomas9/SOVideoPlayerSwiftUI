//
//  VideosListView.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-13.
//

import SwiftUI
import MarkdownUI
import AVKit

struct VideosListView: View {

    @StateObject private var viewModel = VideosListViewModel()
    var player = AVPlayer()
    @State private var isPlaying = false

    var body: some View {

        GeometryReader { geo in
            VStack {
                videoPlayerView
                    .frame(width: geo.size.width,
                           height: geo.size.height * 0.3,
                           alignment: .center)
                ScrollView {
                    videoDetailView
                }
            }
        }
        .task {
            await viewModel.getVideos()
        }
    }

    var videoDetailView: some View {

        VStack(alignment: .leading) {
            // show error message in case of network error
            if case .error = viewModel.state {
                Text("Network Error")
            }
            Text(viewModel.currentVideo?.title ?? "")
                .font(.title)
                .bold()
                .foregroundStyle(.primary)
            Text(viewModel.currentVideo?.author.name ?? "")
                .font(.subheadline)
                .italic()
                .foregroundStyle(.secondary)
            Divider()
            Markdown {
                MarkdownContent(viewModel.currentVideo?.description ?? "Loading")
            }.clipped()
        }
    }

    var videoPlayerView: some View {
        VideoPlayer(player: player) {
            // overlay view over the video player
            // with previous, play/ pause, next buttoms
            HStack {
                Button {
                    viewModel.previousVideo()
                } label: {
                    Image("previous").tint(.white)
                }

                Spacer()
                Button {
                    togglePlayPause()
                } label: {
                    Image(isPlaying ? "pause" : "play").tint(.white)
                }
                Spacer()
                Button {
                    viewModel.nextVideo()
                } label: {
                    Image("next").tint(.white)
                }
            }
        }
        .onAppear {
            if let initialVideoURL = URL(string: viewModel.currentVideo?.fullURL ?? "") {
                let playerItem = AVPlayerItem(url: initialVideoURL)
                player.replaceCurrentItem(with: playerItem)
            }
        }
        .onChange(of: viewModel.currentVideo) { newVideo in
            if let videoURL = URL(string: newVideo?.fullURL ?? "") {
                let playerItem = AVPlayerItem(url: videoURL)
                player.replaceCurrentItem(with: playerItem)
            }
        }
        .onReceive(player.publisher(for: \.timeControlStatus)) { status in
            isPlaying = (status == .playing)
        }
    }

    private func togglePlayPause() {
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }

}

#Preview {
    VideosListView()
}
