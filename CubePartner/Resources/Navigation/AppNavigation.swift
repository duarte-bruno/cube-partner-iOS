import SwiftUI

enum AppNavigation: FeatureNavigation {
    
    // MARK: - Screens
    
    case MainTab
    
    // MARK: - Feature
    
    case OnboardingFeature
    
    // MARK: - Properties
    
    public var id: Int {
        self.name.hashValue
    }
    
    var name: String {
        switch self {
        case .MainTab:
            return "MainTab"
        case .OnboardingFeature:
            return "OnboardingFeature"
        }
    }
    
    var presentationMode: FeatureNavigationPresentationMode {
        switch self {
        case .OnboardingFeature:
            return .sheet
        case .MainTab:
            return .fullScreenCover
        }
    }
    
    @MainActor
    var view: AnyView {
        switch self {
        case .MainTab:
            return AnyView(MainTabView())
        case .OnboardingFeature:
            return AnyView(MainTabView())
        }
    }
    
    var interactiveDismissDisabled: Bool {
        switch self {
        case .OnboardingFeature:
            return true
        default:
            return false
        }
    }
    
    // MARK: - Methods
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
