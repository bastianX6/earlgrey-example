import Foundation

protocol ItunesDataSourceProtocol {
    func getSearchResults(for text: String, success: @escaping (ItunesSearchResponse) -> Void, failure: @escaping (Error) -> Void)
}

enum ItunesDataSourceError: Error {
    case parseError
}
