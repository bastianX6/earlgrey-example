import UIKit
import SDWebImage

class LookupViewController: UIViewController {
    var presenter: LookupPresenterProtocol?

    @IBOutlet var artistImageView: UIImageView!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var collectionNameLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!

    convenience init(presenter: LookupPresenterProtocol) {
        self.init(nibName: LookupViewController.nameOfClass, bundle: nil)
        self.presenter = presenter
    }

    // MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAccessibilityIds()
        presenter?.loadDetailInformation()
    }
}

extension LookupViewController: LookupViewProtocol {
    func reloadView(with element: DetailResultModelProtocol) {
        self.artistImageView.sd_setImage(with: element.imageURL)
        self.trackNameLabel.text = element.trackName
        self.artistNameLabel.text = element.artistName
        self.collectionNameLabel.text = element.collectionName
    }
}

extension LookupViewController: AccessibilityConfigurable {
    func setAccessibilityIds() {
        self.trackNameLabel.accessibilityIdentifier = AccessibilityIds.trackNameLabel
        self.collectionNameLabel.accessibilityIdentifier = AccessibilityIds.collectionNameLabel
        self.artistNameLabel.accessibilityIdentifier = AccessibilityIds.artistNameLabel
    }

    struct AccessibilityIds {
        static let trackNameLabel = LookupViewController.nameOfClass + ".trackNameLabel"
        static let collectionNameLabel = LookupViewController.nameOfClass + ".collectionNameLabel"
        static let artistNameLabel = LookupViewController.nameOfClass + ".artistNameLabel"
    }
}
