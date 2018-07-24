import XCTest
import Sencha
import EarlGrey
@testable import EarlGreyExample

class IntegrationTestsSencha: XCTestCase {

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

    func testSearchExample() {
        let searchText = "Metallica\n"

        app.window?.rootViewController = SearchWireframe.assemble()
        type(text: searchText, inElementWith: .firstElementWith(.accessibilityID(SearchViewController.AcessibilityIds.searchBar)))
        tap(.firstElementWith(.class(SearchTableViewCell.self)))

        assertVisible(.accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel))
        assertVisible(.accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel))
        assertVisible(.accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel))
    }

    func testSearchExample2() {
        let searchText = "31 minutos"
        let cellLabelText = "El Señor Interesante"
        app.window?.rootViewController = SearchWireframe.assemble()

        replace(text: searchText, inElementWith: .firstElementWith(.accessibilityID(SearchViewController.AcessibilityIds.searchBar)))
        type(text: "\n", inElementWith: .firstElementWith(.accessibilityID(SearchViewController.AcessibilityIds.searchBar)))

        tap(.firstElementWith(.text(cellLabelText)), inScrollableElementWith: .accessibilityID(SearchViewController.AcessibilityIds.tableView))

        assertVisible(.accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel))
        assertVisible(.accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel))
        assertVisible(.accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel))
    }

}
