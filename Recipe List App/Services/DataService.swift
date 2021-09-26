//
//  DataService.swift
//  DataService
//
//  Created by dennis on 9/25/21.
//

import Foundation

class DataService {
    
    // static 키워드를 함수에 사용하면 해당 클래스의 인스턴스를 만들지 않고도 접근할 수 있도록 해준다.
    static func getLocalData() -> [Recipe] {
        
        // Parse the local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise... if 문 대신에 guard 를 사용하여 pathString 이 nil 인지 확인하기 위함.
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique ID
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                // Error with parsing json
                print(error)
            }

        }
        catch {
            // Error with getting data
            print(error)
        }
        
        return [Recipe]()
        
    }
    
}
