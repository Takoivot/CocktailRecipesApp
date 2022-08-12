//
//  CocktailViewCell.swift
//  CocktailRecipesApp
//
//  Created by Артур Сахбиев on 12.08.2022.
//

import Foundation

protocol CocktailCellViewModelProtocol {
    var cocktailName: String {get}
    var imageData: Data? {get}
    
    init(drink: Drinks)
}

class CocktailCellViewModel: CocktailCellViewModelProtocol {
    
    var cocktailName: String {
        drink.strDrink
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImage(from: drink.strDrinkThumb)
    }
    
    private let drink: Drinks
    
    required init(drink: Drinks) {
        self.drink = drink
    }
    
    
}
