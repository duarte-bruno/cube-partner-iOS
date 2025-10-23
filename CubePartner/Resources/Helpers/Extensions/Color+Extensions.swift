import SwiftUI

// MARK: - HEX

extension Color {
    /// Initializes a Color from a hexadecimal string, e.g., "#FA5903" or "FA5903".
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let hexString = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        var hexNumber: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&hexNumber)
        
        let r = Double((hexNumber & 0xFF0000) >> 16) / 255
        let g = Double((hexNumber & 0x00FF00) >> 8)  / 255
        let b = Double( hexNumber & 0x0000FF       ) / 255
        
        self.init(.sRGB, red: r, green: g, blue: b, opacity: 1)
    }
}
