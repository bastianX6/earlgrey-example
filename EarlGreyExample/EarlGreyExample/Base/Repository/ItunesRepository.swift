import Foundation

class ItunesRepository: ItunesRepositoryProtocol {
    let dataSource: ItunesDataSourceProtocol

    init(dataSource: ItunesDataSourceProtocol) {
        self.dataSource = dataSource
    }

    func getSearchResults(for text: String, success: @escaping ([SearchResultModelProtocol]) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.getSearchResults(for: text, success: { (itunesResponse) in
            if let results = itunesResponse.results {
                let models = results.map({ (element) -> SearchResultModelProtocol in
                    return SearchResultModel(entity: element)
                })
                success(models)
            } else {
                failure(ItunesRepositoryError.parseError)
            }
        }, failure: {(error) in
            failure(error)
        })
    }
}
