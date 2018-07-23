import UIKit

protocol LookupWireframeProtocol: class {
    static func assemble(id: Int64) -> UIViewController
}

protocol LookupViewProtocol: class {
    var presenter: LookupPresenterProtocol? { get set }

    func reloadView(with element: DetailResultModelProtocol)
}

protocol LookupInteractorProtocol: class {
    var delegate: LookupInteractorDelegate? { get set }

    func fetchDetail(forId id: Int64)
}

protocol LookupInteractorDelegate: class {
    func fetchDetailSuccess(element: DetailResultModelProtocol)
    func fetchDetailFail(error: Error)
}

protocol LookupPresenterProtocol: class {
    var view: LookupViewProtocol? { get set }
    var interactor: LookupInteractorProtocol? { get set }
    var router: LookupRouterProtocol? { get set }

    func loadDetailInformation()
}

protocol LookupRouterProtocol: class {
    var viewController: UIViewController? { get set }
    func showErrorAlert(error: Error)
}
