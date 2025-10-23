import SwiftUI

struct FeatureView<ViewModel: FeatureViewModel<Navigation>, Navigation: FeatureNavigation>: View {
    
    // MARK: - Init

    init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Properties

    @ObservedObject var viewModel: ViewModel

    // MARK: - Body

    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            viewModel.buildView(for: viewModel.initialView)
                .navigationBarHidden(true)
                .navigationDestination(for: Navigation.self) { destination in
                    viewModel.buildView(for: destination)
                        .navigationBarHidden(true)
                        .interactiveDismissDisabled(destination.interactiveDismissDisabled)
                }
                .sheet(item: $viewModel.sheet) { destination in
                    viewModel.buildView(for: destination)
                        .navigationBarHidden(true)
                        .interactiveDismissDisabled(destination.interactiveDismissDisabled)
                }
                .fullScreenCover(item: $viewModel.fullScreenCover) { destination in
                    viewModel.buildView(for: destination)
                        .navigationBarHidden(true)
                        .interactiveDismissDisabled(destination.interactiveDismissDisabled)
                }
        }
    }
}

