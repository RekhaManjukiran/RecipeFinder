//
//  RecipeFinderInteractor.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit

class RecipeFinderInteractor: RecipeFinderInteractorProtocol {
    
    var entities: RecipeFinderEntityManagerProtocol?
    var recipeItemsArray: [RecipeItem] = [RecipeItem]()
    
    private let titleKey = "title"
    private let urlKey = "href"
    private let ingredientsKey = "ingredients"
    private let imageKey = "thumbnail"

    init(entities: RecipeFinderEntityManagerProtocol) {
        self.entities = entities
    }
    
    
    func retrieveRecipes(recipeTitle: String, pageIndex : Int, completionHandler: @escaping RetrieveRecipeCompletionHandler) {
        entities?.retrieveRecipes(recipeTitle: recipeTitle,  pageIndex : pageIndex, completionHandler: { success, json in
            if success {
                self.recipeItemsArray .removeAll()
                if let resultsArray = json["results"] as? [[String: Any]] {
                    for recipeItem in resultsArray {
                        let recipeObject = RecipeItem()
                        if let recipeTitle = recipeItem[self.titleKey] as? String {
                            recipeObject.recipeTitle = recipeTitle
                        }
                        if let recipeImage = recipeItem[self.imageKey] as? String {
                            recipeObject.recipeImage = recipeImage
                        }
                        if let recipeUrl = recipeItem[self.urlKey] as? String {
                            recipeObject.recipeUrl = recipeUrl
                        }
                        if let ingredients = recipeItem[self.ingredientsKey] as? String {
                            recipeObject.ingredients = ingredients
                        }
                        
                        self.recipeItemsArray.append(recipeObject)
                    }
                    completionHandler(success,self.recipeItemsArray)
                }
            } else{
                
            }})
    }
}
