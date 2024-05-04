//
//  RecipeSearchService.swift
//  CookBook
//
//  Created by Alex Fogg on 4/5/2024.
//

import Foundation

//struct ResponseData: Decodable {
//    let recipes: [Recipe]
//    
//    enum CodingKeys: CodingKey {
//        case recipes
//      }
//}


func getRecipes(searchTerm: String, callback: @escaping (_: [Recipe]) -> Void) -> Void {
//    var recipes: [Recipe] = []
//    
//    let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=" + searchTerm)!
//    var request = URLRequest(url: url)
//    
//    request.setValue("8b0f6fb7f8c749228f867ee137822b61", forHTTPHeaderField: "X-Api-Key")
//    
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        if let data = data {
//            do {
//                let recipes = try JSONDecoder().decode([Recipe].self, from: data)
//            } catch {
//                print("Error decoding JSON: \(error)")
//            }
//        } else if let error = error {
//            print("Error: \(error)")
//        }
//    }
//    
//    task.resume()
    
    
    
    let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=" + searchTerm)!
    var request = URLRequest(url: url)
    request.setValue("8b0f6fb7f8c749228f867ee137822b61", forHTTPHeaderField: "x-api-key")
    
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
//                let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
//                let recipes = responseData.recipes
            } catch {
                print("couldnt decode \(error)")
            }
        } else {
            print("response code \(response.statusCode)")
        }
      }
    }
    
    task.resume()
//    return []
}
    
    
//func getRecipes(searchTerm: String) async throws -> [Recipe] {
//    let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=" + searchTerm)!
//    var request = URLRequest(url: url)
//    request.setValue("8b0f6fb7f8c749228f867ee137822b61", forHTTPHeaderField: "X-Api-Key")
//
//    let (data, _) = try await URLSession.shared.data(for: request)
//    let recipes = try JSONDecoder().decode([Recipe].self, from: data)
//    return recipes
//}
