import XCTest
import EarlGrey
@testable import EarlGreyExample

class LookupTests: XCTestCase {

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

    func testLookupLoadSuccess() {
        let index = ItunesDataSourceMockLookupIndex.first
        let response = MockUtils.getCodableFromResource(named: "lookup\(index.rawValue)", type: ItunesSearchResponse.self)!
        let detailResult = MockUtils.getDetailResultModel(from: response)!

        let dataSource = ItunesDataSourceMock(searchSuccess: true, detailSuccess: true)
        dataSource.lookupIndex = index

        app.window?.rootViewController = UINavigationController(rootViewController: LookupWireframe.assemble(id: 0, dataSource: dataSource))

        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel)).assert(grey_text(detailResult.artistName!))
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel)).assert(grey_text(detailResult.collectionName!))
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel)).assert(grey_text(detailResult.trackName!))
    }

    func testLookupLoadSuccess2() {
        let index = ItunesDataSourceMockLookupIndex.second
        let response = MockUtils.getCodableFromResource(named: "lookup\(index.rawValue)", type: ItunesSearchResponse.self)!
        let detailResult = MockUtils.getDetailResultModel(from: response)!

        let dataSource = ItunesDataSourceMock(searchSuccess: true, detailSuccess: true)
        dataSource.lookupIndex = index

        app.window?.rootViewController = UINavigationController(rootViewController: LookupWireframe.assemble(id: 0, dataSource: dataSource))

        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel)).assert(grey_text(detailResult.artistName!))
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel)).assert(grey_text(detailResult.collectionName!))
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel)).assert(grey_text(detailResult.trackName!))
    }

    func testLookupLoadSuccess3() {
        let index = ItunesDataSourceMockLookupIndex.sixteen
        let response = MockUtils.getCodableFromResource(named: "lookup\(index.rawValue)", type: ItunesSearchResponse.self)!
        let detailResult = MockUtils.getDetailResultModel(from: response)!

        let dataSource = ItunesDataSourceMock(searchSuccess: true, detailSuccess: true)
        dataSource.lookupIndex = index

        app.window?.rootViewController = UINavigationController(rootViewController: LookupWireframe.assemble(id: 0, dataSource: dataSource))

        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel)).assert(grey_text(detailResult.artistName!))
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel)).assert(grey_text(detailResult.collectionName!))
        EarlGrey.selectElement(with: grey_accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel)).assert(grey_text(detailResult.trackName!))
    }

    func testSearchFailure() {
        let dataSource = ItunesDataSourceMock(searchSuccess: false, detailSuccess: false)
        let alertTitle = LookupLocalizer.localizedString("lookup.errorAlert.title", comment: "")
        let alertMessage = String(format: LookupLocalizer.localizedString("lookup.errorAlert.message", comment: ""), ItunesDataSourceMockError.detail.localizedDescription)
        let alertOkButton = LookupLocalizer.localizedString("lookup.errorAlert.okButton", comment: "")

        app.window?.rootViewController = UINavigationController(rootViewController: LookupWireframe.assemble(id: 0, dataSource: dataSource))

        EarlGrey.selectElement(with: grey_text(alertTitle)).assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_text(alertMessage)).assert(grey_sufficientlyVisible())
        EarlGrey.selectElement(with: grey_text(alertOkButton)).assert(grey_sufficientlyVisible())

        EarlGrey.selectElement(with: grey_text(alertOkButton)).perform(grey_tap())
    }
}
