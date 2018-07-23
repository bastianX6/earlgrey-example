import Foundation

class SearchLocalizer {
    private static let tableName = "Search"
    class func localizedString(_ key: String, comment: String) -> String {
        return NSLocalizedString(key, tableName: self.tableName, bundle: Bundle.main, value: "", comment: comment)
    }
}
