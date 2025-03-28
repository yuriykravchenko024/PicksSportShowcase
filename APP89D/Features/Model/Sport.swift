import Foundation

enum Sport: Int, Identifiable, CaseIterable, Codable {
    case basketball
    case soccer
    case hockey
    case volleyball
    case tennis
    case bicycling
    case boxing
    case mma
}

extension Sport {
    var id: Self { self }
    
    var imageName: String {
        return "sport" + String(rawValue)
    }
    
    var title: String {
        switch self {
        case .basketball: return "Basketball"
        case .soccer: return "Football"
        case .hockey: return "Hockey"
        case .volleyball: return "Volleyball"
        case .tennis: return "Tennis"
        case .bicycling: return "Bicycling"
        case .boxing: return "Boxing"
        case .mma: return "MMA"
        }
    }
}
