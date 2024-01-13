//
//  SOPlayerView.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-13.
//

import SwiftUI
import AVKit

struct SOPlayerView: UIViewControllerRepresentable {

    var player: AVPlayer

    class Coordinator: NSObject, AVPlayerViewControllerDelegate {
        var parent: SOPlayerView

        init(parent: SOPlayerView) {
            self.parent = parent
            super.init()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
       // controller.delegate = context.coordinator
        controller.showsPlaybackControls = true
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {

       //  uiViewController.player = player
        // uiViewController.showsPlaybackControls = true
    }
}
