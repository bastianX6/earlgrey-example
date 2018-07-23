import Foundation

protocol ItunesRepositoryProtocol {
    func getSearchResults(for text: String, success: @escaping ([SearchResultModelProtocol]) -> Void, failure: @escaping (Error) -> Void)
}

protocol SearchResultModelProtocol {
    var artistName: String? { get set }
    var trackName: String? { get set }
    var imageURL: URL? { get set }
}

enum ItunesRepositoryError: Error {
    case parseError
}
