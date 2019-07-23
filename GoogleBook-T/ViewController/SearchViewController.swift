//
//  SearchViewController.swift
//  GoogleBook-T
//
//  Created by Consultant on 7/22/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

  
    @IBOutlet weak var searchTableView: UITableView!
    let viewModel = ViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearch()
        createSearchBar()
    }
    
    private func createSearchBar() {
        
        searchController.searchBar.placeholder = "Search Books..."
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        
    }
    

    func setupSearch() {

        searchTableView.register(UINib(nibName: SearchViewCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: SearchViewCell.identifier)


//        searchTableView.tableFooterView = UIView(frame: .zero)
        viewModel.delegate = self
        definesPresentationContext = true
    }

}

extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewCell.identifier, for: indexPath) as! SearchViewCell

        let book = viewModel.books[indexPath.row]
        cell.configureBook(with: book)


        return cell
    }

}


extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }

}
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text?.replacingOccurrences(of: " ", with: "+") else {
            return
        }
        viewModel.takeBooks(for: searchText)
        print(searchText)
    }
}

extension SearchViewController: ViewModelDelegate {
    
    func updateView() {
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
    
}
