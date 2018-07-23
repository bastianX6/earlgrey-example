final class LookupInteractor: LookupInteractorProtocol {
    weak var delegate: LookupInteractorDelegate?
    let repository: ItunesRepositoryProtocol

    init(repository: ItunesRepositoryProtocol) {
        self.repository = repository
    }

    func fetchDetail(forId id: Int64) {
        self.repository.getDetail(forId: id, success: { (element) in
            self.delegate?.fetchDetailSuccess(element: element)
        }, failure: {(error) in
            self.delegate?.fetchDetailFail(error: error)
        })
    }
}
