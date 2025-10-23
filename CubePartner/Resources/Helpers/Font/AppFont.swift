import Foundation

enum AppFont {
    enum weight: String {
        case thin = "Thin"
        case light = "Light"
        case extraLight = "ExtraLight"
        case regular = "Regular"
        case medium = "Medium"
        case semiBold = "SemiBold"
        case bold = "Bold"
        case extraBold = "ExtraBold"
        case black = "Black"
        // Italic Variants
        case thinItalic = "ThinItalic"
        case lightItalic = "LightItalic"
        case extraLightItalic = "ExtraLightItalic"
        case regularItalic = "Italic"
        case mediumItalic = "MediumItalic"
        case semiBoldItalic = "SemiBoldItalic"
        case boldItalic = "BoldItalic"
        case extraBoldItalic = "ExtraBoldItalic"
        case blackItalic = "BlackItalic"
    }
    
    enum name: String {
        case roboto = "Roboto-"
        case robotoCondensed = "RobotoCondensed-"
    }
    
    enum size: CGFloat {
        case largeTitle = 45
        case title1 = 34
        case title2 = 28
        case title3 = 22
        case title4 = 20
        case headline = 18
        case body = 17
        case footnote = 13
        
        var font: (name: String, weight: String) {
            switch self {
            case .largeTitle, .title1, .title2, .title3, .title4:
                (name.robotoCondensed.rawValue, weight.semiBold.rawValue)
            case .headline:
                (name.roboto.rawValue, weight.bold.rawValue)
            case .body, .footnote:
                (name.roboto.rawValue, weight.regular.rawValue)
            }
        }
    }
}
