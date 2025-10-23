import Foundation

// MARK: - Mock Type Protocol

protocol MockType {
    var fileName: String { get }
}

// MARK: - Mock Helper Protocol

protocol MockHelper: Codable {
    associatedtype MockTypeEnum: MockType
    static func mock(_ type: MockTypeEnum) -> Self
}

// MARK: - Default Mock Helper Implementation

extension MockHelper {
    static func mock(_ type: MockTypeEnum) -> Self {
        guard let url = Bundle.main.url(forResource: type.fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let mockData = try? JSONDecoder().decode(Self.self, from: data) else {
            fatalError("Failed to load \(type.fileName).json from bundle")
        }
        
        return mockData
    }
}
