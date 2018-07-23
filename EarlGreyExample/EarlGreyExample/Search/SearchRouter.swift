import UIKit

class SearchRouter: SearchRouterProtocol {
    var viewController: UIViewController?

    func presentErrorAlert(error: Error) {
        let title = SearchLocalizer.localizedString("search.errorAlert.title", comment: "")
        let message = String(format: SearchLocalizer.localizedString("search.errorAlert.message", comment: ""), error.localizedDescription)
        let okButtonTitle = SearchLocalizer.localizedString("search.errorAlert.okButton", comment: "")

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        self.viewController?.present(alert, animated: true, completion: nil)
    }

    func presentDetailPage(model: SearchResultModelProtocol) {
        if let navController = viewController as? UINavigationController, let trackId = model.trackId {
            let lookupVC = LookupWireframe.assemble(id: trackId)
            navController.pushViewController(lookupVC, animated: true)
        }
    }
}
