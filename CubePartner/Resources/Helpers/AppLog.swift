//

import Foundation
import OSLog

final class AppLog {
    public static let shared = AppLog()
    private let logger: Logger
    private let showDebug: Bool

    init(config: AppConfigurationProtocol = AppConfiguration.shared, category: String = Bundle.main.bundleIdentifier ?? "App") {
        self.showDebug = config.showDebugLogs
        self.logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "App", category: category)
    }

    func debug(_ message: String) {
        guard showDebug else { return }
        logger.debug("🪲 \(message, privacy: .public)")
    }

    func info(_ message: String) {
        guard showDebug else { return }
        logger.info("⚠️ \(message, privacy: .public)")
    }

    func error(_ message: String) {
        guard showDebug else { return }
        logger.error("🚫 \(message, privacy: .public)")
    }

    func logRequest(_ request: URLRequest) {
        guard showDebug else { return }
        var msg = "➡️ REQUEST"
        msg += "\n   Method: \(request.httpMethod ?? "GET")"
        msg += "\n   URL: \(request.url?.absoluteString ?? "Unknown")"
        
        if let headers = request.allHTTPHeaderFields, !headers.isEmpty {
            msg += "\n   Headers:"
            for (key, value) in headers.sorted(by: { $0.key < $1.key }) {
                msg += "\n      \(key): \(value)"
            }
        }
        
        if let body = request.httpBody {
            msg += "\n   Body:"
            if let bodyString = String(data: body, encoding: .utf8) {
                if let prettyJSON = prettyPrintJSON(bodyString) {
                    msg += "\n\(prettyJSON.components(separatedBy: "\n").map { "      \($0)" }.joined(separator: "\n"))"
                } else {
                    msg += "\n      \(bodyString)"
                }
            } else {
                msg += "\n      [Binary data - \(body.count) bytes]"
            }
        }
        
        logger.debug("\(msg, privacy: .public)")
    }

    func logResponse(_ data: Data, response: URLResponse) {
        guard showDebug else { return }
        guard let httpResponse = response as? HTTPURLResponse else {
            logger.debug("↩️ RESPONSE: Non-HTTP response: \(response)")
            return
        }
        
        var msg = "↩️ RESPONSE"
        msg += "\n   Status: \(httpResponse.statusCode)"
        msg += "\n   URL: \(httpResponse.url?.absoluteString ?? "Unknown")"
        
        let headers = httpResponse.allHeaderFields
        if !headers.isEmpty {
            msg += "\n   Headers:"
            for (key, value) in headers.sorted(by: { "\($0.key)" < "\($1.key)" }) {
                msg += "\n      \(key): \(value)"
            }
        }
        
        if !data.isEmpty {
            msg += "\n   Body:"
            if let bodyString = String(data: data, encoding: .utf8) {
                if let prettyJSON = prettyPrintJSON(bodyString) {
                    msg += "\n\(prettyJSON.components(separatedBy: "\n").map { "      \($0)" }.joined(separator: "\n"))"
                } else {
                    msg += "\n      \(bodyString)"
                }
            } else {
                msg += "\n      [Binary data - \(data.count) bytes]"
            }
        }
        
        logger.debug("\(msg, privacy: .public)")
    }
    
    private func prettyPrintJSON(_ jsonString: String) -> String? {
        guard let data = jsonString.data(using: .utf8),
              let jsonObject = try? JSONSerialization.jsonObject(with: data),
              let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted, .sortedKeys]),
              let prettyString = String(data: prettyData, encoding: .utf8) else {
            return nil
        }
        return prettyString
    }

    // MARK: - Static Convenience Wrappers

    static func debug(_ message: String) {
        shared.debug(message)
    }

    static func info(_ message: String) {
        shared.info(message)
    }

    static func error(_ message: String) {
        shared.error(message)
    }

    static func logRequest(_ request: URLRequest) {
        shared.logRequest(request)
    }

    static func logResponse(_ data: Data, response: URLResponse) {
        shared.logResponse(data, response: response)
    }
}
