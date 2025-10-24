import SwiftUI

struct MainView<ViewModel: MainViewModelProtocol>: View {
    
    // MARK: - Init

    init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    init() where ViewModel == MainViewModel {
        self.viewModel = MainViewModel()
    }

    // MARK: - Properties

    @ObservedObject fileprivate var viewModel: ViewModel

    // MARK: - Body

    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            ZStack {
                GeometryReader { geometry in
                    VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.4)
                            .aspectRatio(1, contentMode: .fit)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(for: AppNavigation.self) { destination in
                destination.view
                    .navigationBarHidden(true)
                    .interactiveDismissDisabled(destination.interactiveDismissDisabled)
            }
            .sheet(item: $viewModel.sheet) { destination in
                destination.view
                    .navigationBarHidden(true)
                    .interactiveDismissDisabled(destination.interactiveDismissDisabled)
            }
            .fullScreenCover(item: $viewModel.fullScreenCover) { destination in
                destination.view
                    .navigationBarHidden(true)
                    .interactiveDismissDisabled(destination.interactiveDismissDisabled)
            }
        }
        .onAppear { 
            viewModel.handleOnAppear()
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
