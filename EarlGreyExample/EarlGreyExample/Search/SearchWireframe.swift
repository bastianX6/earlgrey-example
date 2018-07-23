import UIKit

class SearchWireframe: SearchWireframeProtocol {
    
    static func assemble() -> UIViewController {
        let dataSource = ItunesDataSoruce()
        let repository = ItunesRepository(dataSource: dataSource)
        let interactor = SearchInteractor(repository: repository)
        let router = SearchRouter()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let view = SearchViewController(presenter: presenter)
        let navigation = UINavigationController(rootViewController: view)

        interactor.delegate = presenter
        router.viewController = view
        presenter.view = view

        return navigation
    } 
}