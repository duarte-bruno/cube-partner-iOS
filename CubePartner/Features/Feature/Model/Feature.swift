import SwiftUI

// MARK: - FeatureNavigationPresentationMode

public enum FeatureNavigationPresentationMode: String {
    case push
    case sheet
    case fullScreenCover
}

// MARK: - FeatureNavigation

protocol FeatureNavigation: CaseIterable, Hashable, Identifiable {
    var id: Int { get }
    var interactiveDismissDisabled: Bool { get }
    var presentationMode: FeatureNavigationPresentationMode { get }
    
    func hash(into hasher: inout Hasher)
    static func == (lhs: Self, rhs: Self) -> Bool
}

// MARK: - FeatureNavigationController

class FeatureNavigationController {
    
    // MARK: - Init
    
    init(
        hasDestinationToPop: @escaping () -> Bool, 
        hasDestinationToDismiss: @escaping () -> Bool, 
        pop: @escaping () -> Void, 
        dismiss: @escaping () -> Void
    ) {
        self.hasDestinationToPop = hasDestinationToPop
        self.hasDestinationToDismiss = hasDestinationToDismiss
        self.pop = pop
        self.dismiss = dismiss
    }
    
    // MARK: - Properties
    
    var hasDestinationToPop: () -> Bool
    var hasDestinationToDismiss: () -> Bool
    var pop: () -> Void
    var dismiss: () -> Void
}

// MARK: - AppNavigationConfig

class AppNavigationConfig {
    private init() { }
    
    static let shared = AppNavigationConfig()
    
    var popSwipeGestureEnabled = false
}

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if AppNavigationConfig.shared.popSwipeGestureEnabled {
            return viewControllers.count > 1    
        }
        return false
    }
}
