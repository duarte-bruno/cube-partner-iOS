import Foundation

// Ex: Fridrich Method
struct SolveMethod: Identifiable, Equatable, Codable {
    let id: Int
    let name: String
    let description: String
    let groups: [SolveGroup]
}

// Ex: Cross, F2L, OLL, PLL
struct SolveGroup: Identifiable, Equatable, Codable {
    let id: Int
    let name: String
    let description: String
    let subGroups: [SolveSubGroup]
}

// Ex: Basics, Advanced
struct SolveSubGroup: Identifiable, Equatable, Codable {
    let id: Int
    let name: String
    let algorithms: [Algorithm]
}

// Ex: "R U R' U'"
struct Algorithm: Identifiable, Equatable, Codable {
    let id: Int
    let name: String
    let description: String
    let sequence: [Notation]
}
