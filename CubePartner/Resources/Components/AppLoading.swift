//

import SwiftUI

struct AppLoading: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        if isLoading {
            VStack(alignment: .center, spacing: AppSpace.medium) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .appPrimary))
                    .controlSize(.large)
            }
            .frame(maxWidth: .infinity)
        } else {
            EmptyView()
        }
    }
}
