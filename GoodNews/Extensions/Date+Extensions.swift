//
//  Date+Extensions.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 23..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation

extension Date {
    static func dateAsStringForTableViewHeader() -> String {
        let formatter = DateFormatter()

        formatter.dateFormat = "MMM dd "
        return formatter.string(from: Date())
    }
}
