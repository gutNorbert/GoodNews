//
//  Category.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 14..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation

struct Category {
    let title: String
    let article: [Article]

    static func all() -> [String] {
        return ["Business","Entertainment","General","Sports"]
    }
}
