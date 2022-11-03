//
//  AppColor.swift
//  RecipeAcademy
//
//  Created by Jeremy T. Cruzado on 7/5/22.
//

import Foundation
import SwiftUI
 

//196, 217, 193
struct AppColor {
  static let background: Color = Color(.sRGB,
                                       red: 196/255,
                                       green: 217/255,
                                       blue: 193/255,
                                       opacity: 1)
  static let foreground: Color = Color(.sRGB,
                                       red: 118/255,
                                       green: 119/255,
                                       blue: 231/255,
                                       opacity: 1)
}

extension Color: RawRepresentable {
  public init?(rawValue: String) {
    do {
      let encodedData = rawValue.data(using: .utf8)!
      let components = try JSONDecoder().decode([Double].self, from: encodedData)
      self = Color(red: components[0],
                   green: components[1],
                   blue: components[2],
                   opacity: components[3])
    }
    catch {
      return nil
    }
  }
 
  public var rawValue: String {
    guard let cgFloatComponents = UIColor(self).cgColor.components else { return "" }
    let doubleComponents = cgFloatComponents.map { Double($0) }
    do {
      let encodedComponents = try JSONEncoder().encode(doubleComponents)
      return String(data: encodedComponents, encoding: .utf8) ?? ""
    }
    catch {
      return ""
    }
  }
}
