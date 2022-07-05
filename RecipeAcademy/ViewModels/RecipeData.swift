//
//  RecipeData.swift
//  RecipeAcademy
//
//  Created by Jeremy T. Cruzado on 7/5/22.
//

import Foundation

class RecipeData: ObservableObject {
  @Published var recipes = Recipe.testRecipes
}
