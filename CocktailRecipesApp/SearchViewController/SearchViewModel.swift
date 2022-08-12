//
//  SearchViewModel.swift
//  CocktailRecipesApp
//
//  Created by Артур Сахбиев on 12.08.2022.
//

import Foundation

protocol SearchViewModelProtocol {
    var drinks: [Drinks] {get}
    
    func fetchDrinks(completions: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CocktailCellViewModelProtocol
}

class SearchViewModel: SearchViewModelProtocol {
    var drinks: [Drinks] = []
    
    func fetchDrinks(completions: @escaping () -> Void) {
        NetworkManager.shared.fetchCocktails { cocktails in
            self.drinks = cocktails
            completions()
        }
    }
    
    func numberOfRows() -> Int {
        drinks.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CocktailCellViewModelProtocol {
        let drink = drinks[indexPath.row]
        return CocktailCellViewModel(drink: drink)
    }
    
}
