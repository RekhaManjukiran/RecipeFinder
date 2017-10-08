//
//  RecipeFinderEntityManagerProtocol.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit

protocol RecipeFinderEntityManagerProtocol: class {
    
    var recipeJSON: [String: Any] { get }
    
    func retrieveRecipes(recipeTitle: String,  pageIndex : Int, completionHandler: @escaping RetrieveRecipeJSONCompletionHandler)
}
