import Foundation

protocol ItunesRepositoryProtocol {
    func getSearchResults(for text: String, success: @escaping ([SearchResultModelProtocol]) -> Void, failure: @escaping (Error) -> Void)
    func getDetail(forId id: Int64, success: @escaping (DetailResultModelProtocol) -> Void, failure: @escaping (Error) -> Void)
}

protocol SearchResultModelProtocol {
    var artistName: String? { get set }
    var trackName: String? { get set }
    var imageURL: URL? { get set }
    var trackId: Int64? { get set }
}

protocol DetailResultModelProtocol {
    var artistName: String? { get set }
    var trackName: String? { get set }
    var imageURL: URL? { get set }
    var trackId: Int64? { get set }
    var collectionName: String? { get set }
}

enum ItunesRepositoryError: Error {
    case parseError
}
