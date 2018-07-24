import UIKit

class SearchWireframe: SearchWireframeProtocol {

    static func assemble(dataSource: ItunesDataSourceProtocol = ItunesDataSoruce()) -> UIViewController {
        let repository = ItunesRepository(dataSource: dataSource)
        let interactor = SearchInteractor(repository: repository)
        let router = SearchRouter()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let view = SearchViewController(presenter: presenter)
        let navigation = UINavigationController(rootViewController: view)

        interactor.delegate = presenter
        router.viewController = navigation
        presenter.view = view

        return navigation
    }
}
