//
//  RecipeFinderRouterProtocol.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit

protocol RecipeFinderRouterProtocol: class {
    weak var presenter: RecipeFinderPresenterProtocol? { get }
    
    func configureRecipeFinderViewController() -> (navController : UINavigationController, homeViewContoller : UIViewController)
}
