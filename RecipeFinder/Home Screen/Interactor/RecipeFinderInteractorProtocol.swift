//
//  RecipeFinderInteractorProtocol.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit

typealias RetrieveRecipeCompletionHandler = (_ success: Bool, _ recipeItemArray: [RecipeItem]) -> Void
typealias RetrieveRecipeJSONCompletionHandler = (_ success: Bool, _ recipeItemJson: [String:Any]) -> Void


protocol RecipeFinderInteractorProtocol: class {
    
    var entities: RecipeFinderEntityManagerProtocol? { get }
    
    func retrieveRecipes(recipeTitle: String,  pageIndex : Int, completionHandler: @escaping RetrieveRecipeCompletionHandler)
}
