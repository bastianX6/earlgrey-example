final class SearchInteractor: SearchInteractorProtocol {
    let repository: ItunesRepositoryProtocol
    weak var delegate: SearchInteractorDelegate?

    init(repository: ItunesRepositoryProtocol) {
        self.repository = repository
    }

    func fetchSearchResults(for text: String) {
        self.repository.getSearchResults(for: text, success: { (elements) in
            self.delegate?.fetchSearchResultSuccess(elements: elements)
        }, failure: {(error) in
            self.delegate?.fecthSearchResultsFailure(error: error)
        })
    }
}
