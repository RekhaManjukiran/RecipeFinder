//
//  RecipeDetailsViewController.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeDetailsViewController: UIViewController {
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeIngredientsTextView: UITextView!
    
    @IBOutlet weak var viewFullRecipeButton: UIButton!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    var recipeItem: RecipeItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = URL(string: recipeItem.recipeImage)
        self.recipeImageView.sd_setImage(with: imageUrl, placeholderImage:UIImage(named: "PuppyPlaceHolder_Image"), options:SDWebImageOptions.progressiveDownload, completed: nil)
        self.recipeIngredientsTextView.text = recipeItem.ingredients
        self.recipeIngredientsTextView.font = UIFont.bodyFont
        self.ingredientsLabel.text = "Ingredients:"
        self.ingredientsLabel.font = UIFont.titleFont
        navigationController?.isNavigationBarHidden = false
        title = recipeItem.recipeTitle
        viewFullRecipeButton.setTitle("See Full Recipe", for: UIControlState.normal)
        
    }
    
    
    @IBAction func viewFullRecipeButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "RecipeFinderHome", bundle: nil)
        if let recipeWebViewController = storyboard.instantiateViewController(withIdentifier: "RecipeDetailsWebViewController") as? RecipeDetailsWebViewController {
            recipeWebViewController.recipeDetailsUrl = recipeItem.recipeUrl
            recipeWebViewController.recipeTitle = recipeItem.recipeTitle
        self.navigationController?.pushViewController(recipeWebViewController, animated: true)
        }
    }
    
}
