import SwiftUI
import Combine

@MainActor
protocol MainViewModelProtocol: ObservableObject {
    var title: String { get }
    var navigationPath: NavigationPath { get set }
    var sheet: AppNavigation? { get set }
    var fullScreenCover: AppNavigation? { get set }
    
    func handleOnAppear()
}

final class MainViewModel: MainViewModelProtocol {

    // MARK: - Init

    init() { }

    // MARK: - Properties

    @Published var title: String = "App MainViewModel View"
    @Published var navigationPath = NavigationPath()
    @Published var sheet: AppNavigation?
    @Published var fullScreenCover: AppNavigation?

    // MARK: - Methods

    func handleOnAppear() {
        fullScreenCover = .MainTab
        return
    }
}
