//
//  NewsDetailsViewModel.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 23..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation

struct NewsDetailsViewModel {
    let article: Article
}

extension NewsDetailsViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension NewsDetailsViewModel {
    var sourceName: String {
        return self.article.sourceName
    }

    var url: String? {
        return self.article.url
    }
}
