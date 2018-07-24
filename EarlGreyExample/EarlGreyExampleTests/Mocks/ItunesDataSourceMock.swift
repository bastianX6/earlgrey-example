import Foundation
@testable import EarlGreyExample

class ItunesDataSourceMock: ItunesDataSourceProtocol {
    private let searchSuccess: Bool
    private let detailSuccess: Bool

    var lookupIndex: ItunesDataSourceMockLookupIndex = .first

    init(searchSuccess: Bool, detailSuccess: Bool) {
        self.searchSuccess = searchSuccess
        self.detailSuccess = detailSuccess
    }

    func getSearchResults(for text: String, success: @escaping (ItunesSearchResponse) -> Void, failure: @escaping (Error) -> Void) {
        if self.searchSuccess {
            if let response = MockUtils.getCodableFromResource(named: "search", type: ItunesSearchResponse.self) {
                success(response)
            } else {
                failure(ItunesDataSourceMockError.searchResults)
            }
        } else {
            failure(ItunesDataSourceMockError.searchResults)
        }
    }

    func getDetail(forId id: Int64, success: @escaping (ItunesSearchResponse) -> Void, failure: @escaping (Error) -> Void) {
        if self.detailSuccess {
            if let response = MockUtils.getCodableFromResource(named: "lookup\(lookupIndex.rawValue)", type: ItunesSearchResponse.self) {
                success(response)
            } else {
                failure(ItunesDataSourceMockError.searchResults)
            }
        } else {
            failure(ItunesDataSourceMockError.detail)
        }
    }
}

enum ItunesDataSourceMockError: Error {
    case searchResults, detail
}

enum ItunesDataSourceMockLookupIndex: Int {
    case first = 0, second, sixteen = 15
}
