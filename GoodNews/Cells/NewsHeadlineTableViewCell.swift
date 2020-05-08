//
//  NewsHeadlineTableViewCell.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 13..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation
import UIKit

class NewsHeadlineTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var headlineImgView: UIImageView!
}

extension NewsHeadlineTableViewCell {
    func configure(vm: ArticleViewModel){
        self.titleLbl.text = vm.title
        self.descriptionLbl.text = vm.description
        vm.image { self.headlineImgView.image = $0 }
    }
}
