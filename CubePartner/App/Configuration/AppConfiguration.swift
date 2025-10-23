import Foundation

enum AppEnvironment: String {
    case development = "DevConfiguration"
    case production = "ProdConfiguration"
}

enum ConfigurationProperties: String {
    case host = "HOST"
}

protocol AppConfigurationProtocol {
    var host: String { get }
    var showDebugLogs: Bool { get }
    
    func changeEnvironment(_ environment: AppEnvironment)
}

final class AppConfiguration: AppConfigurationProtocol {
    
    // MARK: Initialization
    
    // Private initializer to enforce the singleton pattern.
    private init() {
        loadConfiguration()
    }
    
    // MARK: Properties
    
    static let shared = AppConfiguration()
    private var config: [String: Any] = [:]
    private var environment: AppEnvironment = .development
    var showDebugLogs: Bool {
        return environment == .development ? true : false
    }
    
    /// Accessor for the host (e.g., API base URL).
    var host: String {
        guard let host = config[ConfigurationProperties.host.rawValue] as? String else {
            fatalError("(\(ConfigurationProperties.host.rawValue)) not set in this environment file")
        }
        return host
    }
    
    // MARK: Methods
    
    func changeEnvironment(_ environment: AppEnvironment) {
        self.environment = environment
        loadConfiguration() 
    }
    
    /// Load the Configuration.plist from the main bundle.
    private func loadConfiguration() {
        guard let url = Bundle.main.url(forResource: environment.rawValue, withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let configDictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any]
        else {
            fatalError("Unable to load Configuration.plist for \(environment) environment")
        }
        self.config = configDictionary
    }
}
