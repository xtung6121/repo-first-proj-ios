import UIKit

// MARK: - Layout Constants
enum LayoutConstants {
    // Spacing
    enum Spacing {
        static let tiny: CGFloat = 8
        static let small: CGFloat = 12
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        static let xLarge: CGFloat = 32
    }
    
    // Collection View
    enum CollectionView {
        static let padding: CGFloat = Spacing.medium
        static let interItemSpacing: CGFloat = Spacing.small
        static let lineSpacing: CGFloat = Spacing.medium
        static let itemAspectRatio: CGFloat = 1.2
        static let numberOfColumns: CGFloat = 2
    }
}

// MARK: - Typography
enum Typography {
    static let titleLarge = UIFont.systemFont(ofSize: 24, weight: .semibold)
    static let titleMedium = UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let body = UIFont.systemFont(ofSize: 17, weight: .regular)
    static let bodySmall = UIFont.systemFont(ofSize: 13, weight: .regular)
    static let caption = UIFont.systemFont(ofSize: 11, weight: .regular)
}

// MARK: - Colors
extension UIColor {
    static let primaryBackground = UIColor(named: "PrimaryBackground") ?? .systemBackground
    static let primaryText = UIColor.label
    static let secondaryText = UIColor.secondaryLabel
    static let accent = UIColor.systemBlue
}

// MARK: - Strings
enum Strings {
    enum SignUp {
        static let welcomeTitle = "Welcome to us"
        static let welcomeSubtitle = "Hello there, create New account"
        static let haveAccount = "Have an account?"
        static let signIn = "Sign in"
        static let signUp = "Sign up"
        static let namePlaceholder = "Name"
        static let emailPlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let termsAgreement = "By creating an account you agree to our Terms and Conditions"
    }
    
    enum Home {
        static let title = "Home"
        static let categories = "Categories"
    }
    
    enum Errors {
        static let genericError = "Something went wrong. Please try again."
        static let invalidInput = "Please fill all fields correctly."
        static let networkError = "Network error. Please check your connection."
    }
}
