//
//  RecipeModel.swift
//  RecipeModel
//
//  Created by dennis on 9/24/21.
//

import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Greate an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
    
}
