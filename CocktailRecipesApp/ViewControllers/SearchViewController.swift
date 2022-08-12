//
//  SearchViewController.swift
//  CocktailRecipesApp
//
//  Created by Артур Сахбиев on 06.08.2022.
//

import UIKit

class SearchViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        
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

