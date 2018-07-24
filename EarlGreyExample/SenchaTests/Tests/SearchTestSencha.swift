import XCTest
import Sencha
@testable import EarlGreyExample

class SearchTestSencha: XCTestCase {

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

        replace(text: searchText, inElementWith: .firstElementWith(.accessibilityID(SearchViewController.AcessibilityIds.searchBar)))
        type(text: "\n", inElementWith: .firstElementWith(.accessibilityID(SearchViewController.AcessibilityIds.searchBar)))

        assertVisible(.text("Eres Mía"))
        assertVisible(.text("Bella y Sensual"))
        assertVisible(.text("Propuesta Indecente"))
    }

    func testSearchFailure() {
        let dataSource = ItunesDataSourceMock(searchSuccess: false, detailSuccess: true)
        let searchText = "Romeo Santos"
        let alertTitle = SearchLocalizer.localizedString("search.errorAlert.title", comment: "")
        let alertMessage = String(format: SearchLocalizer.localizedString("search.errorAlert.message", comment: ""), ItunesDataSourceMockError.searchResults.localizedDescription)
        let alertOkButton = SearchLocalizer.localizedString("search.errorAlert.okButton", comment: "")

        app.window?.rootViewController = SearchWireframe.assemble(dataSource: dataSource)

        replace(text: searchText, inElementWith: .firstElementWith(.accessibilityID(SearchViewController.AcessibilityIds.searchBar)))
        type(text: "\n", inElementWith: .firstElementWith(.accessibilityID(SearchViewController.AcessibilityIds.searchBar)))

        assertVisible(.text(alertTitle))
        assertVisible(.text(alertMessage))
        assertVisible(.text(alertOkButton))

        tap(.text(alertOkButton))
    }
}
