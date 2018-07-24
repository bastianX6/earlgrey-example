import UIKit

class LookupWireframe: LookupWireframeProtocol {

    static func assemble(id: Int64, dataSource: ItunesDataSourceProtocol = ItunesDataSoruce()) -> UIViewController {
        let repository = ItunesRepository(dataSource: dataSource)
        let interactor = LookupInteractor(repository: repository)
        let router = LookupRouter()
        let presenter = LookupPresenter(interactor: interactor, router: router, id: id)
        let view = LookupViewController(presenter: presenter)

        interactor.delegate = presenter
        router.viewController = view
        presenter.view = view

        return view
    }
}
