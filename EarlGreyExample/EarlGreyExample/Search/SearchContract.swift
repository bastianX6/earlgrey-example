import UIKit

protocol SearchWireframeProtocol: class {
    static func assemble() -> UIViewController
}

protocol SearchViewProtocol: class {
    var presenter: SearchPresenterProtocol? { get set }
    func setElements(_ elements: [SearchResultModelProtocol])
}

protocol SearchInteractorProtocol: class {
    var delegate: SearchInteractorDelegate? { get set }

    func fetchSearchResults(for text: String)
}

protocol SearchInteractorDelegate: class {
    func fetchSearchResultSuccess(elements: [SearchResultModelProtocol])
    func fecthSearchResultsFailure(error: Error)
}

protocol SearchPresenterProtocol: class {
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorProtocol? { get set }
    var router: SearchRouterProtocol? { get set }

    func searchButtonTapped(text: String)
    func cellTapped(model: SearchResultModelProtocol)
}

protocol SearchRouterProtocol: class {
    var viewController: UIViewController? { get set }

    func presentErrorAlert(error: Error)
    func presentDetailPage(model: SearchResultModelProtocol)
}
