//
//  RecipeData.swift
//  RecipeAcademy
//
//  Created by Jeremy T. Cruzado on 7/5/22.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    func add(recipe: Recipe){
        if recipe.isValid {
            recipes.append(recipe)
        }
    }
    // return index of given recipe [ create edit ability ]
    func index(of recipe: Recipe) -> Int? {
        for i in recipes.indices {
            if recipes[i].id == recipe.id {
                return i
            }
        }
        return nil
    }
}
