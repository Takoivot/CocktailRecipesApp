//
//  SearchViewModel.swift
//  CocktailRecipesApp
//
//  Created by Артур Сахбиев on 12.08.2022.
//

import Foundation

protocol SearchViewModelProtocol {
    var drink: [Drinks] {get}
    
    func fetchDrinks(completions: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CocktailCellViewModelProtocol
}

class SearchViewModel: SearchViewModelProtocol {
    var drink:[Drinks] = []
    
    
    func fetchDrinks(completions: @escaping () -> Void) {
        NetworkManager.shared.fetchCocktails() { cocktails in
            self.drink = cocktails 
            completions()
            
        }
    }
    
    func numberOfRows() -> Int {
        drink.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CocktailCellViewModelProtocol {
        let drink = drink[indexPath.row]
        return CocktailCellViewModel(drink: drink)
    }
    
}
