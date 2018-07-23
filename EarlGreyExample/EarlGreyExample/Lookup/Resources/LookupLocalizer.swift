import Foundation

class LookupLocalizer {
    private static let tableName = "Lookup"
    class func localizedString(_ key: String, comment: String) -> String {
        return NSLocalizedString(key, tableName: self.tableName, bundle: Bundle.main, value: "", comment: comment)
    }
}
