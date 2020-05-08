//
//  URL+Extensions.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 14..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation

extension URL {
    static func urlForTopHeadlines(for category: String) -> URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?country=hu&category=\(category)&apiKey=1df6e375ca4b4ccfb05ee474b7e777a2")!
    }
}
