//
//  NewsHeadlinesTableViewController.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 13..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation
import UIKit

class NewsHeadlinesTableViewController: UITableViewController {

    private var categoryListVM: CategoryListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        populateHeadlinesAndArticles()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoryListVM == nil ? 0 : self.categoryListVM.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryListVM.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let name = self.categoryListVM.categoryAtIndex(index: section).name
        return UIView.viewForSectionHeader(title:name)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(self.categoryListVM.heightForHeaderInSection(section))
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsHeadlineTableViewCell", for: indexPath) as? NewsHeadlineTableViewCell else {
            fatalError("NewsHeadlineTableViewCell not found")
        }

        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(index: indexPath.row)

        cell.configure(vm: articleVM)

        return cell
    }

    private func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.tableView.tableHeaderView = UIView.viewForTableViewHeader(subtitle: Date.dateAsStringForTableViewHeader())
    }

    private func populateHeadlinesAndArticles(){
        CategoryService().getAllHeadlinesForAllCategories { [weak self] (category) in
            self?.categoryListVM = CategoryListViewModel(categories: category)
            self?.tableView.reloadData()
        }
    }

    private func prepareSegueForNewsDetails(_ segue: UIStoryboardSegue) {
        guard let newsDetailsVC = segue.destination as? NewsDetailsVC else {
            fatalError("ToNewsDetailsVC is not defined")
        }

        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Unable to get the selected row")
        }

        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(index: indexPath.row)

        newsDetailsVC.article = articleVM.article
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToNewsDetailsVC" {
            prepareSegueForNewsDetails(segue)
        }
    }



}
