import SwiftUI

struct AppScrollBackground<Content: View, Bottom: View>: View {
    private let content: () -> Content
    private let bottomContent: () -> Bottom

    init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder bottomContent: @escaping () -> Bottom = { EmptyView() }
    ) {
        self.content = content
        self.bottomContent = bottomContent
    }

    var body: some View {
        ZStack {
            Color(.appBackground)
                .ignoresSafeArea()

            VStack(spacing: AppSpace.medium) {
                ScrollView(.vertical, showsIndicators: false) {
                    content()
                }

                bottomContent() // EmptyView by default
            }
            .padding(.vertical, AppSpace.medium)
            .padding(.horizontal, AppSpace.large)
        }
    }
}

#Preview {
    AppScrollBackground { 
        Text("Hello")
    } bottomContent: { 
        Text("Hello")
    }
}
