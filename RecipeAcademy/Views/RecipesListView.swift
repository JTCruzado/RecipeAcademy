//
//  ContentView.swift
//  RecipeAcademy
//
//  Created by Jeremy T. Cruzado on 7/5/22.
//

import SwiftUI

struct RecipesListView: View {
  @StateObject var recipeData = RecipeData()
  var body: some View {
    List {
      ForEach(recipeData.recipes) { recipe in
        Text(recipe.mainInformation.name)
      }
    }
    .navigationTitle("All Recipes")
  }
}

extension RecipesListView {
  var recipes: [Recipe] {
    recipeData.recipes
  }
 
  var navigationTitle: String {
    "All Recipes"
  }
}
 
struct RecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      RecipesListView()
    }
  }
}
