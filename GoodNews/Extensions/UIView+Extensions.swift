//
//  UIView+Extensions.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 23..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import UIKit

extension UIView {

    static func viewForTableViewHeader(subtitle: String) -> UIView {
        let screenRect = UIScreen.main.bounds

        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: screenRect.size.width, height: 44))

        let subtitleView = UIView(frame: frame)

        let subtitleLbl = UILabel(frame: frame)
        subtitleLbl.text = subtitle
        subtitleLbl.textAlignment = .center
        subtitleLbl.textColor = .gray

        subtitleView.addSubview(subtitleLbl)

        return subtitleView
    }

    static func viewForSectionHeader(title:String) -> UIView {
        let screenRect = UIScreen.main.bounds
        let headerView = UIView(frame: CGRect(x: 15, y: 0, width: screenRect.width, height: 60))

        headerView.backgroundColor = UIColor.white

        //You can get the frame like this, too
        let sectionHeaderLbl = UILabel(frame: headerView.frame)
        sectionHeaderLbl.text = title.uppercased()
        sectionHeaderLbl.textColor = UIColor.black
        sectionHeaderLbl.font = UIFont.fontForSectionHeaderTitle()

        headerView.addSubview(sectionHeaderLbl)

        return headerView
    }
}

