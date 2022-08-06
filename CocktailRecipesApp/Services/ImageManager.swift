//
//  ImageManager.swift
//  CocktailRecipesApp
//
//  Created by Артур Сахбиев on 06.08.2022.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    private init() {}
    
    func fetchImage(from url: URL?) -> Date?{
        guard let url = url else {return nil}
        guard let imageData = try? Data(contentsOf: url) else {return nil}
        return imageData
    }
}
