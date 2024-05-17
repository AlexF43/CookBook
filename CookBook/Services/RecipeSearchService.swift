//
//  RecipeSearchService.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import Foundation

/// class containing all functions which interact with the spoonacular api
// api docs available at https://spoonacular.com/food-api/docs
class RecipeSearchService {
    // api key for the spoonacular api
    private var apiKey: String = "8b0f6fb7f8c749228f867ee137822b61"
    
    /// returns a list of recipes from a search phrase
    func getRecipes(searchTerm: String, callback: @escaping (_: [Recipe]) -> Void) {
        // construct the full api url with the search term
        let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=" + searchTerm)!
        var request = URLRequest(url: url)
        // add the api key as a header
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        // create a task to make the api request asynchronously
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // if an error occured, print the error message
            if let error = error {
                print("error \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    // if a status code 200 is recieved (success) then try and decode the json into a RecipeListApiResponse
                    do {
                        let recipes = try JSONDecoder().decode(RecipeListApiResponse.self, from: data)
                        // return the recipes in the callback closure
                        callback(recipes.results)
                    } catch {
                        print("couldnt decode \(error)")
                    }
                } else {
                    print("response code \(response.statusCode)")
                }
            }
        }
        // start the task to send the api request
        task.resume()
    }
    
    /// returns a random trivia fact
    func getRandomFoodTrivia(callback: @escaping(_: String) -> Void) {
        let url = URL(string: "https://api.spoonacular.com/food/trivia/random")!
        var request = URLRequest(url: url)
        // add the api key as a header
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        // create a task to make the api request asynchronously
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // if an error occured, print the error message
                print("error \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    // if a status code 200 is recieved (success) then try and decode the json into a TriviaResponse
                    do {
                        let triviaResponse = try JSONDecoder().decode(TriviaResponse.self, from: data)
                        // return the trivia in the callback closure
                        callback(triviaResponse.trivia)
                    } catch {
                        print("couldnt decode \(error)")
                    }
                } else {
                    print("response code \(response.statusCode)")
                }
            }
        }
        // start the task to send the api request
        task.resume()
    }
    
    /// returns extended infomation about a single recipe
    func getDetailedRecipe(recipeId: String, callback:@escaping(_: Recipe) ->Void) {
        // construct the full api url with the recipe id
        let url = URL(string: "https://api.spoonacular.com/recipes/\(recipeId)/information")!
        var request = URLRequest(url: url)
        // add the api key as a header
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        // create a task to make the api request asynchronously
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // if an error occured, print the error message
                print("error \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    // if a status code 200 is recieved (success) then try and decode the json into a RecipeDetailApiResponse
                    do {
                        let recipeResponse = try JSONDecoder().decode(recipeDetailApiResponse.self, from: data)
                        let recipe = self.recipeApiResponseToRecipe(recipeResponse: recipeResponse)
                        // return the recipes in the callback closure
                        callback(recipe)
                    } catch {
                        print("couldnt decode \(error)")
                    }
                } else {
                    print("response code \(response.statusCode)")
                }
            }
        }
        // start the task to send the api request
        task.resume()
    }
    
    /// returns random recipes from the spoonacular api
    func getRandomRecipes(callback: @escaping(_: [Recipe]) -> Void) {
        let url = URL(string: "https://api.spoonacular.com/recipes/random?number=10")!
        var request = URLRequest(url: url)
        // add the api key as a header
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        // create a task to make the api request asynchronously
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // if an error occured, print the error message
                print("error \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    // if a status code 200 is recieved (success) then try and decode the json into a RandomRecipeApiResponse
                    do {
                        let recipseResponse = try JSONDecoder().decode(RandomRecipeApiResponse.self, from: data)
                        // convert each recipe api responses into recipe objects
                        var recipes: [Recipe] = []
                        for recipe in recipseResponse.recipes {
                            recipes.append(self.recipeApiResponseToRecipe(recipeResponse: recipe))
                        }
                        // return the recipes in the callback closure
                        callback(recipes)
                    } catch {
                        print("couldnt decode \(error)")
                    }
                } else {
                    print("response code \(response.statusCode)")
                }
            }
        }
        // start the task to send the api request
        task.resume()
    }
    
    /// converts a recipe api response to recipe object
    func recipeApiResponseToRecipe(recipeResponse: recipeDetailApiResponse) -> Recipe {
        var steps:[Step] = []
        if(!recipeResponse.analyzedInstructions.isEmpty) {
            steps = recipeResponse.analyzedInstructions[0].steps
        }
        return Recipe(id: recipeResponse.id, title: recipeResponse.title, imageUrl: recipeResponse.image, imageData: nil, cookingTime: recipeResponse.readyInMinutes, ingredients: recipeResponse.extendedIngredients, steps: steps)
    }
}
