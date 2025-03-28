import Foundation

enum Tab: Int, Identifiable, CaseIterable {
    case home
    case moments
    case search
    case game
    case favorites
}

extension Tab {
    var id: Self { self }
    
    var icon: String {
        return "tab" + String(rawValue)
    }
    
    var title: String {
        switch self {
        case .home: "Home"
        case .moments: "Moments"
        case .search: "Search"
        case .game: "Choose\nOne"
        case .favorites: "Favorites"
        }
    }
}
