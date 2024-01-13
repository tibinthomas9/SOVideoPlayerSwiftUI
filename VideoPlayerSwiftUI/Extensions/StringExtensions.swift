//
//  StringExtensions.swift
//  VideoPlayerSwiftUI
//
//  Created by Tibin Thomas on 2024-01-13.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
