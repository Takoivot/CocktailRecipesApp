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
    private let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?i=vodka"
  
    private init() {}
    
    func fetchCocktails( completion : @escaping([Drinks]) -> Void){
        
        AF.request(urlString).responseData { response in
            if let error = response.error {
                print(error.localizedDescription)
                print("1")
                return
            }
            
            guard let data = response.data else {return}
            do {
                let cocktail = try JSONDecoder().decode([Drinks].self, from: data)
                completion(cocktail)
                print("3")
            }catch let error{
                print(error.localizedDescription)
                print("2")
            }
        }
        
}
    
}
