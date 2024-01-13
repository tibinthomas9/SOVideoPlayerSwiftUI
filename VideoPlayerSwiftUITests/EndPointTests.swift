//
//  EndPointTests.swift
//  VideoPlayerSwiftUITests
//
//  Created by Tibin Thomas on 2024-01-12.
//

import XCTest
@testable import VideoPlayerSwiftUI

final class EndPointTests: XCTestCase {

    func testVideoEndpointUrl() {
        let url = AppEndPoint.videos.url()
        XCTAssertEqual(url?.absoluteString, "http://localhost:4000/videos")
    }

}
