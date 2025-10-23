import Foundation

enum AppError: Error {
    case initialization(_ description: String, _ error: Error? = nil)
}
