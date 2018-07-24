import XCTest
import EarlGrey
@testable import EarlGreyExample

class IntegrationTests: XCTestCase {

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
        EarlGrey.selectElement(with: grey_accessibilityID(SearchViewController.AcessibilityIds.searchBar))
            .atIndex(0)
            .perform(grey_typeText(searchText))
        EarlGrey.selectElement(with: grey_kindOfClass(SearchTableViewCell.self))
            .atIndex(0)
            .perform(grey_tap())

        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel))
            .assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel))
            .assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel))
            .assert(grey_sufficientlyVisible())
    }

    func testSearchExampleFail() {
        var error: NSError? = nil
        let searchText = "31 minutos"
        app.window?.rootViewController = SearchWireframe.assemble()
        EarlGrey.selectElement(with: grey_accessibilityID(SearchViewController.AcessibilityIds.searchBar))
            .atIndex(0)
            .perform(grey_typeText(searchText), error: &error)

        XCTAssert(error != nil)
    }

    func testSearchExample2() {
        let searchText = "31 minutos"
        let cellLabelText = "El Señor Interesante"
        let halfScreenSize: CGFloat = UIScreen.main.bounds.height / 2
        app.window?.rootViewController = SearchWireframe.assemble()

        EarlGrey.selectElement(with: grey_accessibilityID(SearchViewController.AcessibilityIds.searchBar))
            .atIndex(0)
            .perform(grey_replaceText(searchText))
        EarlGrey.selectElement(with: grey_accessibilityID(SearchViewController.AcessibilityIds.searchBar))
            .atIndex(0)
            .perform(grey_typeText("\n"))

        EarlGrey.selectElement(with: grey_allOf([grey_text(cellLabelText), grey_interactable()]))
            .atIndex(0)
            .usingSearch(grey_scrollInDirection(.down, halfScreenSize), onElementWith: grey_accessibilityID(SearchViewController.AcessibilityIds.tableView))
            .perform(grey_tap())

        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel))
            .assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel))
            .assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel))
            .assert(grey_sufficientlyVisible())
    }

}
