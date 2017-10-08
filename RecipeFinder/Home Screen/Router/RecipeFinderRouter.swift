//
//  RecipeFinderRouter.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit

class RecipeFinderRouter: RecipeFinderRouterProtocol {
    
    weak var presenter: RecipeFinderPresenterProtocol?
    
    func configureRecipeFinderViewController() -> (navController : UINavigationController, homeViewContoller : UIViewController) {
        let entities = RecipeFinderEntityManager()
        let interactor = RecipeFinderInteractor(entities: entities)
        let presenter = RecipeFinderPresenter(interactor: interactor, router: self)
        self.presenter = presenter
        let storyBoard = UIStoryboard.init(name: "RecipeFinderHome", bundle: nil)
        
        if let navController = storyBoard.instantiateInitialViewController() as? UINavigationController {
            
            if let homeViewController = storyBoard.instantiateViewController(withIdentifier: "RecipeFinderViewController") as? RecipeFinderViewController  {
                    homeViewController.presenter = presenter
                    navController.setViewControllers([homeViewController], animated: false)
                return (navController,homeViewController)
            }
        }
        
        return (UINavigationController(), UIViewController())
        
    }
}
