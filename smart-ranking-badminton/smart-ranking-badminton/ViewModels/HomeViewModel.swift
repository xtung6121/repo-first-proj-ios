import Foundation

// MARK: - HomeViewModel Protocol
protocol HomeViewModelProtocol {
    var numberOfCategories: Int { get }
    var onCategoriesUpdated: (() -> Void)? { get set }
    var onError: ((String) -> Void)? { get set }
    
    func loadCategories()
    func category(at index: Int) -> Category?
    func didSelectCategory(at index: Int)
}

// MARK: - HomeViewModel
final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Properties
    private var categories: [Category] = []
    
    // MARK: - Callbacks (Closures for binding)
    var onCategoriesUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    var onCategorySelected: ((Category) -> Void)?
    
    // MARK: - Computed Properties
    var numberOfCategories: Int {
        return categories.count
    }
    
    // MARK: - Public Methods
    
    /// Load categories data
    func loadCategories() {
        // TODO: Replace with API call later
        // For now, use dummy data
        categories = Category.getDummyDatas()
        
        // Notify view that data is ready
        onCategoriesUpdated?()
    }
    
    /// Get category at specific index
    /// - Parameter index: Index of category
    /// - Returns: Category if exists, nil otherwise
    func category(at index: Int) -> Category? {
        guard index >= 0 && index < categories.count else {
            onError?("Invalid category index")
            return nil
        }
        return categories[index]
    }
    
    /// Handle category selection
    /// - Parameter index: Selected index
    func didSelectCategory(at index: Int) {
        guard let category = category(at: index) else { return }
        
        // Log selection (for debugging, remove in production)
        #if DEBUG
        print("Selected category: \(category.category)")
        #endif
        
        // Notify view about selection
        onCategorySelected?(category)
    }
}

// MARK: - Category Model Extension (for display logic)
extension Category {
    /// Get display title
    var displayTitle: String {
        return category.capitalized
    }
    
    /// Check if has valid image
    var hasValidImage: Bool {
        return !image.isEmpty
    }
}
