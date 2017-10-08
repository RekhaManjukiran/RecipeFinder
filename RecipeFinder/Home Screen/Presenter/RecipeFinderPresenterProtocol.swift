//
//  RecipeFinderPresenterProtocol.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit

protocol RecipeFinderPresenterProtocol: class {
    
    var interactor: RecipeFinderInteractorProtocol? { get }
    
    init(interactor: RecipeFinderInteractorProtocol, router: RecipeFinderRouterProtocol)
    
    func retrieveRecipes(recipeTitle: String, pageIndex : Int, completionHandler: @escaping RetrieveRecipeCompletionHandler)
}
