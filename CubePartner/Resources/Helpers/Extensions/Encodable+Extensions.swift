import Foundation

extension Encodable {
    func asDictionary() -> [String: String] {
        guard let data = try? JSONEncoder().encode(self),
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return [:]
        }
        
        return dictionary.compactMapValues { value in
            if let stringValue = value as? String {
                return stringValue
            } else if let intValue = value as? Int {
                return String(intValue)
            }
            return nil
        }
    }
}
