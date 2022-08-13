//
//  CocktailCell.swift
//  CocktailRecipesApp
//
//  Created by Артур Сахбиев on 12.08.2022.
//

import UIKit

class CocktailCell: UITableViewCell {
    var viewModel: CocktailCellViewModelProtocol? {
        didSet{
            var content = defaultContentConfiguration()
            content.text = viewModel?.cocktailName
            guard let imageData = viewModel?.imageData else {return}
            content.image = UIImage(data: imageData)
            contentConfiguration = content
            backgroundColor = .cyan
        }
    }
}
