//

import Foundation

extension DateFormatter {
    /// Convenience initializer that applies common settings.
    convenience init(format: String) {
        self.init()
        self.dateFormat = format
        self.locale = Locale(identifier: "en_US_POSIX")
        self.timeZone = .current
    }

    /// `yyyy-MM-dd` for birthdates.
    static let yyyyMMdd: DateFormatter = .init(format: "yyyy-MM-dd")

    /// `MM-dd-yyyy HH:mm` for session expirations.
    static let mmDdyyyyHHmm: DateFormatter = .init(format: "MM-dd-yyyy HH:mm")
}
