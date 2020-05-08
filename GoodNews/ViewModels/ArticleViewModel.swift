//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 16..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import UIKit

struct ArticleViewModel {
    private(set) var article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }

    var title: String {
        return self.article.title
    }

    var description: String? {
        return self.article.description
    }

    func image(completion: @escaping (UIImage?) -> ()){
        guard let imageURL = article.imageURL else {
            completion(nil)
            return
        }

        UIImage.imageForHeadline(url: imageURL) { (image) in
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}

