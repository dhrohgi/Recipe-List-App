//
//  ContentView.swift
//  Recipe List App
//
//  Created by dennis on 9/24/21.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) {r in
                
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack(spacing: 7.0) {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text(r.name)
                                .fontWeight(.bold)
                                
                            Text(r.totalTime)
                        }
                    }
                }
            }
            .navigationBarTitle("All Recipes!")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
