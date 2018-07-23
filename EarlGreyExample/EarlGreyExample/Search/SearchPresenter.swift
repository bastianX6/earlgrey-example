class SearchPresenter: SearchPresenterProtocol {
    var view: SearchViewProtocol?
    var interactor: SearchInteractorProtocol?
    var router: SearchRouterProtocol?

    convenience init(interactor: SearchInteractorProtocol, router: SearchRouterProtocol) {
        self.init()
        self.interactor = interactor
        self.router = router
    }

    func searchButtonTapped(text: String) {
        self.interactor?.fetchSearchResults(for: text)
    }

    func cellTapped(model: SearchResultModelProtocol) {
        self.router?.presentDetailPage(model: model)
    }
}

extension SearchPresenter: SearchInteractorDelegate {
    func fetchSearchResultSuccess(elements: [SearchResultModelProtocol]) {
        self.view?.setElements(elements)
    }

    func fecthSearchResultsFailure(error: Error) {
        self.router?.presentErrorAlert(error: error)
    }
}
