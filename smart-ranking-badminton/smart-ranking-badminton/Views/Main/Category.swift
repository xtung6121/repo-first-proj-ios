import Foundation

final class Category {
    var image: String
    var category: String
    
    init(category: String, image: String) {
        self.category = category
        self.image = image
    }
}

extension Category {
    static func getDummyDatas() -> [Category] {
        var categories: [Category] = []
        
        for i in 1...5 {
            let category = Category(category: "\(i)", image: "\(i % 10)")
            categories.append(category)
        }
        
        return categories
    }
}
