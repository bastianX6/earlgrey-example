import UIKit

class LookupRouter: LookupRouterProtocol {
    var viewController: UIViewController?

    func showErrorAlert(error: Error) {
        let title = LookupLocalizer.localizedString("lookup.errorAlert.title", comment: "")
        let message = String(format: LookupLocalizer.localizedString("lookup.errorAlert.message", comment: ""), error.localizedDescription)
        let okButtonTitle = LookupLocalizer.localizedString("lookup.errorAlert.okButton", comment: "")

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        self.viewController?.present(alert, animated: true, completion: nil)
    }
}
