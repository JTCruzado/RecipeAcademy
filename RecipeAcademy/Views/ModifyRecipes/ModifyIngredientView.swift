//
//  ModifyIngredientView.swift
//  RecipeAcademy
//
//  Created by Jeremy T. Cruzado on 8/24/22.
//

import SwiftUI
 
struct ModifyIngredientView: View {
  @State var ingredient: Ingredient
 
  var body: some View {
    VStack {
      Form {
        TextField("Ingredient Name", text: $ingredient.name)
        Stepper(value: $ingredient.quantity, in: 0...100, step: 1.0) {
          HStack {
            Text("Quantity:")
            TextField("Quantity",
                      value: $ingredient.quantity,
                      formatter: NumberFormatter())
              .keyboardType(.numbersAndPunctuation)
          }
        }
        Picker(selection: $ingredient.unit, label:
                HStack {
                  Text("Unit")
                  Spacer()
                  Text(ingredient.unit.rawValue)
                }) {
          ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
            Text(unit.rawValue)
          }
        }
        .pickerStyle(MenuPickerStyle())
      }
    }
  }
}
        struct ModifyIngredientView_Previews: PreviewProvider {
            @State static var emptyIngredient = Ingredient(name: "",
                                                           quantity: 1.0,
                                                           unit: .none)
            static var previews: some View {
                NavigationView {
                    ModifyIngredientView(ingredient: emptyIngredient)
                }
            }
        }
        
        
