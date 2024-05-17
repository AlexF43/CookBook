//
//  EditorPicksRecipes.swift
//  CookBook
//
//  Created by Alex Fogg on 17/5/2024.
//

import Foundation

/// contains hardcoded editors picks recipes
struct EditorPicksRecipes {
    var editorPicks: [Recipe] = [
        Recipe(id: nil, title: "Cheesy Potato and Bacon Lasagne", description: "Potato bake with a lasagne twist", imageUrl: "https://img.taste.com.au/0OZ2-PBz/w720-h480-cfill-q80/taste/2018/06/cheesy-potato-and-bacon-lasagne-138403-1.jpg", imageData: nil, cookingTime: 95, ingredients: [
            Ingredient(name: "Bacon Rashers", descName: "4 middle bacon rashers, rinds removed", amount: UnitModel(amount: 4, unit: "item")),
            Ingredient(name: "Potatoes", descName: "1.5kg large sebago potatoes, peeled, sliced lengthways into 5mm-thick slices", amount: UnitModel(amount: 1.5, unit: "kg")),
            Ingredient(name: "Grated Mozzerella", descName: "200g (2 cups) coarsely grated mozzarella", amount: UnitModel(amount: 200, unit: "g")),
            Ingredient(name: "White Pepper", descName: "White pepper, to season", amount: UnitModel(amount: 1, unit: "item")),
            Ingredient(name: "Cream", descName: "300mL carton pouring cream", amount: UnitModel(amount: 300, unit: "mL")),
            Ingredient(name: "Milk", descName: "125ml (1/2 cup) milk", amount: UnitModel(amount: 125, unit: "mL")),
            Ingredient(name: "Eggs", descName: "2 eggs, lightly whisked", amount: UnitModel(amount: 2, unit: "item"))
        ], steps: [
            Step(number: 1, name: "Preheat oven to 170C/150C fan forced. Grease a 20cm-square baking dish with oil. Coarsely chop 3 bacon rashers. Reserve the remaining rasher. Place chopped bacon in a non-stick frying pan over medium-high heat. Cook, stirring occasionally, for 5 minutes, or until crisp."),
            Step(number: 2, name: "Place a layer of potatoes in the base of the prepared dish. Sprinkle over half the bacon and one-third of the cheese. Pour over one-quarter of the cream. Season with salt and white pepper. "),
            Step(number: 3, name: "Top with another layer of potato, remaining bacon, half the remaining mozzarella and one-third of the remaining cream. Finish with a layer of potato."),
            Step(number: 4, name: "Whisk the milk, egg and remaining cream in a bowl. Season with salt and white pepper. Pour mixture over the potato and scatter with the remaining mozzarella. Cut the reserved bacon rasher into large pieces and arrange over the top of the cheese."),
            Step(number: 5, name: "Cover the dish with baking paper and foil. Bake for 55 minutes or until potato is nearly tender. Uncover and cook for another 15-20 minutes or until golden and bubbling. Stand for 10 minutes before serving.")
        ]),
        Recipe(id: nil, title: "Crispy Chicken Tacos", description: "Taco Tuesday just got tastier", imageUrl: "https://img.taste.com.au/U-djJurP/w720-h480-cfill-q80/taste/2018/01/crispy-chicken-tacos-134732-1.jpg", imageData: nil, cookingTime: 30, ingredients: [
            Ingredient(name: "Mission Taco Seasoning", descName: "35g packet Mission Taco Seasoning", amount: UnitModel(amount: 35, unit: "g")),
            Ingredient(name: "Rice Flour", descName: "2 tbsp of rice flour", amount: UnitModel(amount: 2, unit: "tbsp")),
            Ingredient(name: "Chicken Thigh Fillets (thinly sliced)", descName: "750 grams Chicken Thigh Fillets", amount: UnitModel(amount: 750, unit: "g")),
            Ingredient(name: "Olive Oil", descName: "2 tbsp olive oil", amount: UnitModel(amount: 2, unit: "tbsp")),
            Ingredient(name: "Taco Shells", descName: "12 taco shells", amount: UnitModel(amount: 12, unit: "item")),
            Ingredient(name: "Carrot", descName: "1 carrot, peeled, cut into matchsticks", amount: UnitModel(amount: 1, unit: "item")),
            Ingredient(name: "Red Capsicum", descName: "1 red capsicum, seeded, thinly sliced", amount: UnitModel(amount: 1, unit: "item")),
            Ingredient(name: "Chinese Cabbage", descName: "80g shredded wombok (Chinese cabbage)", amount: UnitModel(amount: 80, unit: "g")),
            Ingredient(name: "Lebanese Cucumber", descName: "1 Lebanese cucumber, cut into matchsticks", amount: UnitModel(amount: 1, unit: "item")),
            Ingredient(name: "Avocados", descName: "2 avocados, stoned, peeled, mashed", amount: UnitModel(amount: 2, unit: "item")),
            Ingredient(name: "Fetta", descName: "60g fetta, crumbled", amount: UnitModel(amount: 60, unit: "g")),
            Ingredient(name: "Coriander Leaves", descName: "1/4 cup coriander leaves", amount: UnitModel(amount: 1/4, unit: "cup")),
            Ingredient(name: "Salsa", descName: "Salsa, to serve", amount: UnitModel(amount: 1, unit: "item")),
            Ingredient(name: "Lime Wedges", descName: "Lime Wedges, to serve", amount: UnitModel(amount: 1, unit: "item"))
        ], steps: [
            Step(number: 1, name: "Combine seasoning and rice flour in a bowl. Add chicken. Toss to combine."),
            Step(number: 2, name: "Heat oil in a frying pan over medium heat. Cook chicken in 3 batches, turning occasionally, for 5 mins or until golden and cooked through. Transfer to a plate lined with paper towel."),
            Step(number: 3, name: "Meanwhile, heat the taco shells following packet directions."),
            Step(number: 4, name: "Combine carrot, capsicum, wombok and cucumber in a bowl. Divide avocado, carrot mixture and chicken among taco shells. Top with fetta, coriander and salsa. Serve with lime wedges.")
        ]),
        Recipe(id: nil, title: "Classic Chewy Brownies", description: "The classic fudgy, chewy brownies", imageUrl: "https://img.taste.com.au/5hsR3Ore/w720-h480-cfill-q80/taste/2016/11/classic-chewy-brownie-102727-1.jpeg", imageData: nil, cookingTime: 10, ingredients:[
            Ingredient(name: "Unsalted Butter", descName: "125 grams of Unsalted Butter", amount: UnitModel(amount: 125, unit: "g")),
            Ingredient(name: "Baking Dark Chocolate", descName: "125 grams of Baking Dark Chocolate", amount: UnitModel(amount: 125, unit: "g")),
            Ingredient(name: "Eggs", descName: "3 Eggs, lightly whisked", amount: UnitModel(amount: 3, unit: "item")),
            Ingredient(name: "White Sugar", descName: "335 grams of white sugar", amount: UnitModel(amount: 335, unit: "g")),
            Ingredient(name: "Plain Flour", descName: "115 grams of Plain Flour", amount: UnitModel(amount: 115, unit: "g")),
            Ingredient(name: "Dutch cocoa powder", descName: "30 grams of Dutch cocoa powder", amount: UnitModel(amount: 30, unit: "g")),
            Ingredient(name: "Vanilla extract", descName: "1 tsp of vanilla extract", amount: UnitModel(amount: 1, unit: "tsp"))
        ], steps: [
            Step(number: 1, name: "Preheat oven to 180C/160C fan forced. Grease a 20cm (base measurement) square cake pan and line with baking paper."),
            Step(number: 2, name: "Place 125g Unsalted Butter, chopped and 125g Baking Dark Chocolate, chopped in a heatproof bowl over a saucepan of simmering water (don't let the bowl touch the water)."),
            Step(number: 3, name: "Stir with a metal spoon until melted. Remove from heat."),
            Step(number: 4, name: "Quickly stir in 3 eggs, lightly whisked, 335g (1 1/2 cups) white sugar, 115g (3/4 cup) plain flour, 30g (1/4 cup) Dutch cocoa powder, 1 tsp vanilla extract and Pinch of salt until just combined."),
            Step(number: 5, name: "Pour into prepared pan. Bake for 30 minutes or until a skewer inserted in the centre comes out with moist crumbs clinging. Set aside to cool completely.")
        ]
              )
        
    ]
}
