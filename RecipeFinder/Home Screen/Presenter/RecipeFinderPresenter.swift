//
//  RecipeFinderPresenter.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit

class RecipeFinderPresenter: RecipeFinderPresenterProtocol {
    
    var interactor: RecipeFinderInteractorProtocol?
    var router: RecipeFinderRouterProtocol?
    
    required init(interactor: RecipeFinderInteractorProtocol, router: RecipeFinderRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func retrieveRecipes(recipeTitle: String, pageIndex : Int, completionHandler: @escaping RetrieveRecipeCompletionHandler) {
        DispatchQueue.main.async { [weak self] in
            self?.interactor?.retrieveRecipes(recipeTitle: recipeTitle, pageIndex : pageIndex, completionHandler: completionHandler)
        }
    }
}
