//
//  RecipeItem.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit

class RecipeItem {
    var recipeTitle: String
    var recipeImage: String
    var recipeUrl: String
    var ingredients: String
    
    init(recipeTitle: String,
        recipeImage: String,
        recipeUrl: String,
        ingredients: String)
    {
        self.recipeTitle = recipeTitle
        self.recipeImage = recipeImage
        self.recipeUrl = recipeUrl
        self.ingredients = ingredients
    }
    
    init()
    {
        self.recipeTitle = ""
        self.recipeImage = ""
        self.recipeUrl = ""
        self.ingredients = ""
    }
}
