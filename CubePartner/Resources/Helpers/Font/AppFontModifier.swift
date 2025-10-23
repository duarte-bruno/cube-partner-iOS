import SwiftUI

struct AppFontModifier: ViewModifier {
    let name: String
    let size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}
