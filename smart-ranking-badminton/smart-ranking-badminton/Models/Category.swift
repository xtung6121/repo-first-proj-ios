import Foundation

struct Category: Hashable {
    var image: String
    var category: String
    
    init(category: String, image: String) {
        self.category = category
        self.image = image
    }
}

extension Category {
    static func getDummyDatas() -> [Category] {
        return [
            Category(category: "Vegan", image: "vegan.png"),
            Category(category: "Drink", image: "drinks.png"),
            Category(category: "Snacks", image: "snack.png"),
            Category(category: "Vegan", image: "vegan.svg"),
            Category(category: "Meal", image: "meal.png"),
            Category(category: "Deresst", image: "snack.png"),
        ]
    }
}


    struct BestSellerFood {
        var image : String
        var price : String
        
        init(image: String, price: String) {
            self.image = image
            self.price = price
        }
    }
        
