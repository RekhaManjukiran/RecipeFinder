//
//  RecipeFinderEntityManager.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit
import Alamofire

class RecipeFinderEntityManager: RecipeFinderEntityManagerProtocol {
    
    var recipeJSON: [String: Any]
    
    init() {
        recipeJSON = [String: Any]()
    }
    
    func retrieveRecipes(recipeTitle: String,  pageIndex : Int,completionHandler: @escaping RetrieveRecipeJSONCompletionHandler) {
        if let escapedString = recipeTitle.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            let urlString = "http://www.recipepuppy.com/api/?&q=\(String(describing: escapedString))&p=\(pageIndex)"
            Alamofire.request(urlString)
                .validate(contentType: ["application/json","text/javascript"])
                .responseJSON(completionHandler: {
                    response in
                    switch response.result{
                    case .success(_):
                        if let json = response.result.value as? [String : Any] {
                            self.recipeJSON = json
                            // Parse JSON
                            completionHandler(true,json)
                            print(json)
                        }
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                        completionHandler(false,["":""])
                    }
                })
        }
    }
}

