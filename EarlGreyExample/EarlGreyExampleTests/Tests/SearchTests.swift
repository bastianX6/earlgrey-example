import XCTest
import EarlGrey
@testable import EarlGreyExample

class SearchTests: XCTestCase {

    let app = UIApplication.shared.delegate as! AppDelegate

    override func setUp() {
        super.setUp()
        app.window?.rootViewController = nil
        app.window?.resignKey()
        app.window = nil
        app.window = UIWindow(frame: UIScreen.main.bounds)
        app.window?.makeKeyAndVisible()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSearchSuccess() {
        let dataSource = ItunesDataSourceMock(searchSuccess: true, detailSuccess: true)
        let searchText = "Romeo Santos"
        app.window?.rootViewController = SearchWireframe.assemble(dataSource: dataSource)

        EarlGrey.selectElement(with: grey_accessibilityID(SearchViewController.AcessibilityIds.searchBar))
            .atIndex(0)
            .perform(grey_replaceText(searchText))
        EarlGrey.selectElement(with: grey_accessibilityID(SearchViewController.AcessibilityIds.searchBar))
            .atIndex(0)
            .perform(grey_typeText("\n"))

        EarlGrey.selectElement(with: grey_text("Eres Mía")).assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_text("Bella y Sensual")).assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_text("Propuesta Indecente")).assert(grey_sufficientlyVisible())
    }

    func testSearchFailure() {
        let dataSource = ItunesDataSourceMock(searchSuccess: false, detailSuccess: true)
        let searchText = "Romeo Santos"
        let alertTitle = SearchLocalizer.localizedString("search.errorAlert.title", comment: "")
        let alertMessage = String(format: SearchLocalizer.localizedString("search.errorAlert.message", comment: ""), ItunesDataSourceMockError.searchResults.localizedDescription)
        let alertOkButton = SearchLocalizer.localizedString("search.errorAlert.okButton", comment: "")

        app.window?.rootViewController = SearchWireframe.assemble(dataSource: dataSource)

        EarlGrey.selectElement(with: grey_accessibilityID(SearchViewController.AcessibilityIds.searchBar))
            .atIndex(0)
            .perform(grey_replaceText(searchText))
        EarlGrey.selectElement(with: grey_accessibilityID(SearchViewController.AcessibilityIds.searchBar))
            .atIndex(0)
            .perform(grey_typeText("\n"))

        EarlGrey.selectElement(with: grey_text(alertTitle)).assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_text(alertMessage)).assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_text(alertOkButton)).assert(grey_sufficientlyVisible())

        EarlGrey.selectElement(with: grey_text(alertOkButton)).perform(grey_tap())
    }
}
