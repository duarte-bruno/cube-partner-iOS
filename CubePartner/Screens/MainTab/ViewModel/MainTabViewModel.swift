import SwiftUI
import Combine

@MainActor
protocol MainTabViewModelProtocol: ObservableObject {
    var events: PassthroughSubject<MainTabViewModelEvent, Never> { get }
    
    var title: String { get }
    
    func handleCallToAction()
}

final class MainTabViewModel: MainTabViewModelProtocol {

    // MARK: - Init

    init() {
        self.events = PassthroughSubject<MainTabViewModelEvent, Never>()
    }

    // MARK: - Properties

    let events: PassthroughSubject<MainTabViewModelEvent, Never>
    @Published var title: String = "App MainTabViewModel View"

    // MARK: - Methods

    func handleCallToAction() {
        print("MainTabViewModel call to action sent")
        events.send(.callToAction)
    }
}
