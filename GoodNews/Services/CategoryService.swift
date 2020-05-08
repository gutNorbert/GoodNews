//
//  CategoryService.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 14..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation

class CategoryService {
    func getAllHeadlinesForAllCategories(completion: @escaping ([Category]) -> ()){
        var categories = [Category]()
        var requestCount = 0
        let categoriesCount = Category.all().count

        Category.all().forEach { (category) in
            WebService().load(Article.by(category)) { (articles) in

                requestCount += 1

                guard let articles = articles else {
                    return
                }

                let category = Category(title: category, article: articles)

//                if requestCount == categoriesCount {
                    DispatchQueue.main.async {
                        completion(categories)
                        }
//                }

                categories.append(category)
            }
        }
    }
}
