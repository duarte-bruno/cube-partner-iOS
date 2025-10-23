import SwiftUI
import Combine

@MainActor
class FeatureViewModel<Navigation: FeatureNavigation>: ObservableObject {
    
    // MARK: - Init

    init(initialView: Navigation) {
        self.navigationPath = NavigationPath()
        self.initialView = initialView
        self.destinationPath = [initialView]
        self.hasDestinationToPop = false
        self.hasDestinationToDismiss = false
    }
    
    // MARK: - Properties

    @Published var navigationPath: NavigationPath
    @Published var sheet: Navigation?
    @Published var fullScreenCover: Navigation?
    private var hasDestinationToPop: Bool
    private var hasDestinationToDismiss: Bool
    
    lazy var controller: FeatureNavigationController = {
        .init(
            hasDestinationToPop: { self.hasDestinationToPop }, 
            hasDestinationToDismiss: { self.hasDestinationToDismiss }, 
            pop: { self.pop() }, 
            dismiss: { self.pop() }
        )
    }()
    
    var destinationPath: [Navigation] {
        didSet {
            if let last = destinationPath.last {
                if last.presentationMode != .push {
                    hasDestinationToDismiss = true
                    hasDestinationToPop = false
                } else {
                    hasDestinationToPop = destinationPath.count > 1
                    hasDestinationToDismiss = false
                }
            } else {
                hasDestinationToDismiss = false
                hasDestinationToPop = false
            }
        }
    }
    var initialView: Navigation
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Methods
    
    func buildView(for screen: Navigation) -> AnyView {
        fatalError("Override buildView(for:) in subclass")
    }
    
    func pop() {
        guard let topDestination = destinationPath.last else { return }

        switch topDestination.presentationMode {
        case .push:
            if !navigationPath.isEmpty {
                navigationPath.removeLast()
            }
        case .sheet:
            sheet = nil
        case .fullScreenCover:
            fullScreenCover = nil
        }
        destinationPath.removeLast()
    }

    func popToRoot() {
        sheet = nil
        fullScreenCover = nil
        if destinationPath.count > 1 {
            navigationPath.removeLast(destinationPath.count - 1)
            destinationPath.removeLast(destinationPath.count - 1)
        }
    }
    
    func popTo(_ destination: Navigation) {
        guard let index = destinationPath.lastIndex(of: destination) else { return }

        // Remove all routes above the target route
        let routesToRemove = destinationPath.count - (index + 1)

        for _ in 0..<routesToRemove {
            guard let topRoute = destinationPath.last else { break }
            switch topRoute.presentationMode {
            case .push:
                if !navigationPath.isEmpty {
                    navigationPath.removeLast()
                }
            case .sheet:
                sheet = nil
            case .fullScreenCover:
                fullScreenCover = nil
            }
            destinationPath.removeLast()
        }
    }

    func push(_ destination: Navigation) {
        switch destination.presentationMode {
        case .push:
            navigationPath.append(destination)
        case .sheet:
            sheet = destination
        case .fullScreenCover:
            fullScreenCover = destination
        }

        destinationPath.append(destination)
    }
    
    func dismissFeature() {
        // TODO: Make this action after creating the feature dismiss
    }
}
