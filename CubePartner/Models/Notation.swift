import Foundation
import SwiftUI

enum Notation: String, CaseIterable, Identifiable {
    
    // MARK: - Side layers of the cube
    
    // Clockwise
    case L = "L"
    case F = "F"
    case R = "R"
    case B = "B"
    case U = "U"
    case D = "D"
    // Counterclockwise
    case Li = "L'"
    case Fi = "F'"
    case Ri = "R'"
    case Bi = "B'"
    case Ui = "U'"
    case Di = "D'"
    // Double Clockwise
    case L2 = "L2"
    case F2 = "F2"
    case R2 = "R2"
    case B2 = "B2"
    case U2 = "U2"
    case D2 = "D2"
    
    // MARK: - Central layers of the cube
    
    // Clockwise
    case M = "M"
    case E = "E"
    case S = "S"
    // Counterclockwise
    case Mi = "M'"
    case Ei = "E'"
    case Si = "S'"
    // Double Clockwise
    case M2 = "M2"
    case E2 = "E2"
    case S2 = "S2"
    
    // MARK: - Two-layer moves
    
    // Clockwise
    case l = "l"
    case f = "f"
    case r = "r"
    case b = "b"
    case u = "u"
    case d = "d"
    // Counterclockwise
    case li = "l'"
    case fi = "f'"
    case ri = "r'"
    case bi = "b'"
    case ui = "u'"
    case di = "d'"
    // Double Clockwise
    case l2 = "l2"
    case f2 = "f2"
    case r2 = "r2"
    case b2 = "b2"
    case u2 = "u2"
    case d2 = "d2"
    
    // MARK: - Cube rotation moves
    
    // Clockwise
    case x = "x"
    case y = "y"
    case z = "z"
    // Counterclockwise
    case xi = "x'"
    case yi = "y'"
    case zi = "z'"
    // Double Clockwise
    case x2 = "x2"
    case y2 = "y2"
    case z2 = "z2"
    
    var id: Int {
        return self.rawValue.hashValue
    }
    
    var image: Image {
        Image(
            self.rawValue
                .replacingOccurrences(of: "'", with: "i")
                .replacingOccurrences(of: "2", with: "")
        )
    }
}
