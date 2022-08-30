//
//  ModifyIngredientsView.swift
//  RecipeAcademy
//
//  Created by Jeremy T. Cruzado on 8/29/22.
//

import SwiftUI

struct ModifyIngredientsView: View {
    @Binding var ingredients: [Ingredient]
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground

    @State private var newIngredient = Ingredient()
    
    var body: some View {
        VStack {
            let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                ingredients.append(ingredient)
                newIngredient = Ingredient()
            }.navigationTitle("Add Ingredient")
            if ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient", destination: addIngredientView)
                Spacer()
            } else {
                HStack {
                    Text("Ingredients")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }
                    .listRowBackground(listBackgroundColor)
                    NavigationLink("Add another Ingredient",
                                   destination: addIngredientView)
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(listBackgroundColor)
                }.foregroundColor(listTextColor)
            }
        }
    }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[1]
    @State static var emptyIngredients = [Ingredient]()
    static var previews: some View {
        NavigationView {
            ModifyIngredientsView(ingredients: $recipe.ingredients)
        }
        NavigationView {
            ModifyIngredientsView(ingredients: $emptyIngredients)
        }
    }
}

