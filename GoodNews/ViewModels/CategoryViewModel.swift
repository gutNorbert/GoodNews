//
//  CategoryViewModel.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 16..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation

struct CategoryViewModel {
    let name: String
    let article: [Article]
}

extension CategoryViewModel {
    func articleAtIndex(index: Int) -> ArticleViewModel {
        let article = self.article[index]
        return ArticleViewModel(article)
    }
}
