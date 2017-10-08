//
//  RecipeFinderViewController.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeFinderViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var recipeListTableView: UITableView!
    
    var pageIndex: Int = 1
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var presenter: RecipeFinderPresenterProtocol?
    var recipeListArray: [RecipeItem] = [RecipeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        navigationController?.isNavigationBarHidden = false
        title = "Recipe Finder"
        pageIndex = 1
        self.configurePageButtons()
        searchTextField.placeholder = "Search recipe"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = searchTextField.text {
            let searchString = (text as NSString).replacingCharacters(in: range, with: string)
            if(searchString.characters.count > 3){
                self.retrieveRecipies(searchString: searchString,
                                      pageIndex: 1)
            } else {
                pageIndex = 1
                self.recipeListArray.removeAll()
                DispatchQueue.main.async {
                    self.configurePageButtons()
                    self.recipeListTableView.reloadData()
                }
            }
        } else {
            pageIndex = 1
            self.recipeListArray.removeAll()
            DispatchQueue.main.async {
                self.configurePageButtons()
                self.recipeListTableView.reloadData()
            }
            
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = recipeListTableView.dequeueReusableCell(withIdentifier: "RecipeFinderTableViewCell", for: indexPath) as? RecipeFinderTableViewCell else {
            return RecipeFinderTableViewCell()
        }
        let recipeItem = recipeListArray[indexPath.row]
        cell.recipeTitleLabel.text = recipeItem.recipeTitle
        cell.recipeTitleLabel.font = UIFont.bodyFont
        let imageUrl = URL(string: recipeItem.recipeImage)
        cell.recipeImageView.sd_setImage(with: imageUrl, placeholderImage:UIImage(named: "PuppyPlaceHolder_Image"), options:SDWebImageOptions.progressiveDownload, completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "RecipeFinderHome", bundle: nil)
        if let recipeDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "RecipeDetailsViewController") as? RecipeDetailsViewController {
            recipeDetailsViewController.recipeItem = recipeListArray[indexPath.row]
            navigationController?.pushViewController(recipeDetailsViewController, animated: true)
        }
    }
    
    func retrieveRecipies(searchString: String, pageIndex : Int) {
        presenter?.retrieveRecipes(recipeTitle: searchString, pageIndex: pageIndex, completionHandler: { success, recipeItemsArray in
            if(success) {
                self.recipeListArray = recipeItemsArray
                DispatchQueue.main.async {
                    self.configurePageButtons()
                    self.recipeListTableView.reloadData()
                }
            } else {
                self.pageIndex = 1
                // Show alert of the error - Graceful handling
            }
        })
        
    }
    
    func configurePageButtons() {
        nextButton.isHidden = !(self.recipeListArray.count > 0)
        prevButton.isHidden = !( pageIndex > 1)
    }
    
    @IBAction func nextButtonPressed() {
        pageIndex = pageIndex+1
        if let searchString = self.searchTextField.text{
        self.retrieveRecipies(searchString: searchString, pageIndex: self.pageIndex)
        }
    }
    
    @IBAction func previousButtonPressed(){
        pageIndex = pageIndex-1
        prevButton.isHidden = pageIndex > 1
        if let searchString = self.searchTextField.text{
            self.retrieveRecipies(searchString: searchString, pageIndex: self.pageIndex)
        }
    }
}

