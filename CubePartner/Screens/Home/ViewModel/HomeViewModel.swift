import SwiftUI
import Combine

@MainActor
protocol HomeViewModelProtocol: ObservableObject {
    var events: PassthroughSubject<HomeViewModelEvent, Never> { get }
    
    var title: String { get }
    
    func handleCallToAction()
}

final class HomeViewModel: HomeViewModelProtocol {

    // MARK: - Init

    init() {
        self.events = PassthroughSubject<HomeViewModelEvent, Never>()
    }

    // MARK: - Properties

    let events: PassthroughSubject<HomeViewModelEvent, Never>
    @Published var title: String = "App HomeViewModel View"

    // MARK: - Methods

    func handleCallToAction() {
        print("HomeViewModel call to action sent")
        events.send(.callToAction)
    }
}
