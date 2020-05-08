//
//  CategoryListViewModel.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 14..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation

struct CategoryListViewModel {
    private(set) var categories: [Category]
}

extension CategoryListViewModel {
    var numberOfSections: Int {
        return self.categories.count
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.categories[section].article.count
    }

    func heightForHeaderInSection(_ section: Int) ->  Double{
        return 60.0
    }

    func categoryAtIndex(index:Int) -> CategoryViewModel {
        return CategoryViewModel(name: categories[index].title, article: categories[index].article)
    }

    func articleForSectionAtIndex(section: Int, index: Int) -> ArticleViewModel {
        return categoryAtIndex(index: section).articleAtIndex(index: index)
    }
}
