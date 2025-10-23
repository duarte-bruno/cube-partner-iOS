import SwiftUI

// MARK: - Corner

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// MARK: - Border

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

// MARK: - Font

extension View {
    func appFont(_ size: AppFont.size = .body, name: AppFont.name? = nil, weight: AppFont.weight? = nil) -> some View {
        let font = createFont(size, name, weight)
        return self.modifier(AppFontModifier(name: font.name, size: font.size))
    }
    
    private func createFont(_ size: AppFont.size = .body, _ name: AppFont.name? = nil, _ weight: AppFont.weight? = nil) -> (name: String, size: CGFloat) {
        let fontSize = size.rawValue
        let fontName = (name?.rawValue ?? size.font.name) + (weight?.rawValue ?? size.font.weight)
        return (fontName, fontSize)
    }
}
