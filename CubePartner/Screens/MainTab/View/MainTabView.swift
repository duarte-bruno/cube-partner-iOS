import SwiftUI

struct MainTabView<ViewModel: MainTabViewModelProtocol>: View {
    
    // MARK: - Init

    init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    init() where ViewModel == MainTabViewModel {
        self.viewModel = MainTabViewModel()
    }

    // MARK: - Properties

    @ObservedObject fileprivate var viewModel: ViewModel

    // MARK: - Body

    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
                    .navigationTitle("Home")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
        }
    }
}

#if DEBUG
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
#endif
