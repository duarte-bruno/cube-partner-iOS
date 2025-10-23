import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    
    // MARK: - Init

    init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    init() where ViewModel == HomeViewModel {
        self.viewModel = HomeViewModel()
    }

    // MARK: - Properties

    @ObservedObject fileprivate var viewModel: ViewModel

    // MARK: - Body

    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.title)
                .font(.headline)
            Button(action: {
                viewModel.handleCallToAction()
            }) {
                Text("Send call to action")
            }
            .buttonStyle(BorderedProminentButtonStyle())
        }
        .padding()
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif