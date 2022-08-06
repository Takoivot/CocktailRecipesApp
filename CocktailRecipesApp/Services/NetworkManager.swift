//
//  NetworkManager.swift
//  CocktailRecipesApp
//
//  Created by Артур Сахбиев on 06.08.2022.
//

import Foundation
import Alamofire


class NetworkManager {
    
    static  let shared = NetworkManager()
    private let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"


    private init() {}
    
    func fetchCocktails(completion : @escaping(Cocktails?) -> Void){
        
        AF.request(urlString).response { response in
            if let error = response.error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = response.data else {return}
            do {
                let cocktail = try JSONDecoder().decode(Cocktails.self, from: data)
                completion(cocktail)
            }catch let error{
                print(error.localizedDescription)
            }
        }
}
}
