//
//  Article.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 14..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation

struct NewsSourcesResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
    let url: String?
    let imageURL: String?
    let sourceName: String

    private enum ArticleKeys: String, CodingKey {
        case title
        case description
        case url
        case imgURL = "urlToImage"
        case source
    }

    private enum SourceKeys: String, CodingKey {
        case name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try? container.decode(String.self, forKey: .description)
        self.url = try? container.decode(String.self, forKey: .url)
        self.imageURL = try? container.decode(String.self, forKey: .imgURL)

        let sourceContainer = try container.nestedContainer(keyedBy: SourceKeys.self, forKey: .source)
        self.sourceName = try sourceContainer.decode(String.self, forKey: .name)
    }
}

extension Article {
    static func by(_ category: String) -> Resource<[Article]>{
        return Resource<[Article]>(url: URL.urlForTopHeadlines(for: category)) { (data) -> [Article]? in
            return try! JSONDecoder().decode(NewsSourcesResponse.self, from: data).articles
        }
    }
}
