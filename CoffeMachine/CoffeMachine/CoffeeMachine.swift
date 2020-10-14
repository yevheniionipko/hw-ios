//
//  File.swift
//  CoffeMachine
//
//  Created by Onipko Jenya on 14.10.2020.
//

import Foundation

class CoffeeMachine {
    enum CoffeeType: Int {
        case americano, cappucino
        var type: String {
            switch self {
            case .americano: return "Your americano Sir"
            case .cappucino: return "Your cappucino Sir"
            default: return "UNEXPECTED COFFEE";
            }
        }
    }
    
    enum CoffeeIngredients: String {
        case beans, water, milk
    }
    
    var stock: [CoffeeIngredients: String] = [:]
    
    func makeCoffee(type: CoffeeType) -> String {
        guard stock[CoffeeIngredients.beans] != nil else {
            return "Not enough beans"
        }
        guard stock[CoffeeIngredients.water] != nil else {
            return "Not enough water"
        }
        
        if type == CoffeeType.cappucino {
            guard stock[CoffeeIngredients.milk] != nil else {
                return "Not enough milk"
            }
            stock.removeValue(forKey: .milk)
        }
        
        stock.removeValue(forKey: .beans)
        stock.removeValue(forKey: .water)
        
        return "\(type.type)"
    }
    
    func addBeans() -> Void {
        stock[.beans] = "1";
    }
    
    func addWater() -> Void {
        stock[.water] = "1";
    }
    
    func addMilk() -> Void {
        stock[.milk] = "1";
    }
}
