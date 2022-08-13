//
//  SearchViewController.swift
//  CocktailRecipesApp
//
//  Created by Артур Сахбиев on 06.08.2022.
//

import UIKit

class SearchViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private let cellID = "cocktail"
    
    private var viewModel: SearchViewModelProtocol? {
        didSet{
            viewModel?.fetchDrinks {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.backgroundColor = .white
        setupNavBar()
        //setupSearchBar()
        
    }
    
    private func setupNavBar() {
        title = "Cocktails Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

    }


}

//MARK: Search Bar Settings
/*
extension SearchViewController: UISearchBarDelegate {
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Enter what you want to drink"
        searchController.searchBar.searchTextField.textColor = .white
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NetworkManager.shared.fetchCocktails(searchText: searchText) { cocktail in
            self.viewModel?.fetchDrinks {
                self.tableView.reloadData()
            }
        }
    }
} */

//MARK: Table View Data Source
extension SearchViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows() ?? 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CocktailCell else { return UITableViewCell()}
        cell.viewModel = viewModel?.cellViewModel(at: indexPath)
        
        return cell
    }

}


