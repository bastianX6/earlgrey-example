class LookupPresenter: LookupPresenterProtocol {

    var view: LookupViewProtocol?
    var interactor: LookupInteractorProtocol?
    var router: LookupRouterProtocol?
    private var id: Int64

    init(interactor: LookupInteractorProtocol, router: LookupRouterProtocol, id: Int64) {
        self.interactor = interactor
        self.router = router
        self.id = id
    }

    func loadDetailInformation() {
        self.interactor?.fetchDetail(forId: id)
    }
}

extension LookupPresenter: LookupInteractorDelegate {
    func fetchDetailSuccess(element: DetailResultModelProtocol) {
        self.view?.reloadView(with: element)
    }

    func fetchDetailFail(error: Error) {
        self.router?.showErrorAlert(error: error)
    }
}
