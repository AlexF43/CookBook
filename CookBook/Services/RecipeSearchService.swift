//
//  RecipeSearchService.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import Foundation


class RecipeSearchService {
    private var apiKey: String = "8b0f6fb7f8c749228f867ee137822b61"
    
    func getRecipes(searchTerm: String, callback: @escaping (_: [Recipe]) -> Void) {
        
        let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=" + searchTerm)!
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("error \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        print(data)
                        let recipes = try JSONDecoder().decode(RecipeApiResponse.self, from: data)
                        print("We got \(recipes.number) results in this request")
                        callback(recipes.results)
                    } catch {
                        print("couldnt decode \(error)")
                    }
                } else {
                    print("response code \(response.statusCode)")
                }
            }
        }
        
        task.resume()
    }
    
    
    func getRandomFoodTrivia(callback: @escaping(_: String) -> Void) {
        let url = URL(string: "https://api.spoonacular.com/food/trivia/random")!
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("error \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        print(data)
                        let triviaResponse = try JSONDecoder().decode(TriviaResponse.self, from: data)
                        print("Got trivia")
                        callback(triviaResponse.trivia)
                    } catch {
                        print("couldnt decode \(error)")
                    }
                } else {
                    print("response code \(response.statusCode)")
                }
            }
        }
        
        task.resume()
    }
    
    
    //todo
    func getDetailedRecipe(recipeId: String, callback:@escaping(_: Recipe) ->Void) {
        let url = URL(string: "https://api.spoonacular.com/recipes/\(recipeId)/information")!
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("error \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        print(data)
                        let recipeResponse = try JSONDecoder().decode(Recipe.self, from: data)
                        print("Got recipe")
                        callback(recipeResponse)
                    } catch {
                        print("couldnt decode \(error)")
                    }
                } else {
                    print("response code \(response.statusCode)")
                }
            }
        }
        
        task.resume()
    }
    
    func getRandomRecipes(callback: @escaping(_: [Recipe]) -> Void) {
        let url = URL(string: "https://api.spoonacular.com/recipes/random?number=10")!
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("error \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        print(data)
                        let recipeResponse = try JSONDecoder().decode(RandomRecipeApiResponse.self, from: data)
                        print("Got recipes")
                        callback(recipeResponse.recipes)
                    } catch {
                        print("couldnt decode \(error)")
                    }
                } else {
                    print("response code \(response.statusCode)")
                }
            }
        }
        
        task.resume()
    }
    
    
}
