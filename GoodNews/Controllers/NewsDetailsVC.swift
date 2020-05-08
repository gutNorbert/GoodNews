//
//  NewsDetailsVC.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 23..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailsVC: UIViewController {

    var article: Article!
    private var newsDetailsVM: NewsDetailsViewModel!
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI(){
        self.newsDetailsVM = NewsDetailsViewModel(article)

        self.navigationItem.largeTitleDisplayMode = .never
        self.title = self.newsDetailsVM.sourceName

        guard let url = self.newsDetailsVM.url,
            let newsDetailURL = URL(string: url) else {
                return
        }

        let request = URLRequest(url: newsDetailURL)
        self.webView.load(request)

    }
}
