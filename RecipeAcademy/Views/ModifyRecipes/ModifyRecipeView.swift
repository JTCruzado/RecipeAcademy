//
//  ModifyRecipeView.swift
//  RecipeAcademy
//
//  Created by Jeremy T. Cruzado on 7/13/22.
//

import SwiftUI
 
struct ModifyRecipeView: View {
  @Binding var recipe: Recipe
 
  var body: some View {
    Button("Fill in the recipe with test data.") {
      recipe.mainInformation = MainInformation(name: "test",
                                               description: "test",
                                               author: "test",
                                               category: .breakfast)
      recipe.directions = [Direction(description: "test",
                                     isOptional: false)]
      recipe.ingredients = [Ingredient(name: "test",
                                       quantity: 1.0,
                                       unit: .none)]
    }
  }
}
 
struct ModifyRecipeView_Previews: PreviewProvider {
  @State static var recipe = Recipe()
  static var previews: some View {
    ModifyRecipeView(recipe: $recipe)
  }
}
