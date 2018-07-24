import XCTest
import Sencha
@testable import EarlGreyExample

class LookupTestSencha: XCTestCase {

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

        assertVisible(.allOf([.accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel), .text(detailResult.artistName!)]))
        assertVisible(.allOf([.accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel), .text(detailResult.collectionName!)]))
        assertVisible(.allOf([.accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel), .text(detailResult.trackName!)]))
    }

    func testLookupLoadSuccess2() {
        let index = ItunesDataSourceMockLookupIndex.second
        let response = MockUtils.getCodableFromResource(named: "lookup\(index.rawValue)", type: ItunesSearchResponse.self)!
        let detailResult = MockUtils.getDetailResultModel(from: response)!

        let dataSource = ItunesDataSourceMock(searchSuccess: true, detailSuccess: true)
        dataSource.lookupIndex = index

        app.window?.rootViewController = UINavigationController(rootViewController: LookupWireframe.assemble(id: 0, dataSource: dataSource))

        assertVisible(.allOf([.accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel), .text(detailResult.artistName!)]))
        assertVisible(.allOf([.accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel), .text(detailResult.collectionName!)]))
        assertVisible(.allOf([.accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel), .text(detailResult.trackName!)]))
    }

    func testLookupLoadSuccess3() {
        let index = ItunesDataSourceMockLookupIndex.sixteen
        let response = MockUtils.getCodableFromResource(named: "lookup\(index.rawValue)", type: ItunesSearchResponse.self)!
        let detailResult = MockUtils.getDetailResultModel(from: response)!

        let dataSource = ItunesDataSourceMock(searchSuccess: true, detailSuccess: true)
        dataSource.lookupIndex = index

        app.window?.rootViewController = UINavigationController(rootViewController: LookupWireframe.assemble(id: 0, dataSource: dataSource))

        assertVisible(.allOf([.accessibilityID(LookupViewController.AccessibilityIds.artistNameLabel), .text(detailResult.artistName!)]))
        assertVisible(.allOf([.accessibilityID(LookupViewController.AccessibilityIds.collectionNameLabel), .text(detailResult.collectionName!)]))
        assertVisible(.allOf([.accessibilityID(LookupViewController.AccessibilityIds.trackNameLabel), .text(detailResult.trackName!)]))
    }

    func testSearchFailure() {
        let dataSource = ItunesDataSourceMock(searchSuccess: false, detailSuccess: false)
        let alertTitle = LookupLocalizer.localizedString("lookup.errorAlert.title", comment: "")
        let alertMessage = String(format: LookupLocalizer.localizedString("lookup.errorAlert.message", comment: ""), ItunesDataSourceMockError.detail.localizedDescription)
        let alertOkButton = LookupLocalizer.localizedString("lookup.errorAlert.okButton", comment: "")

        app.window?.rootViewController = UINavigationController(rootViewController: LookupWireframe.assemble(id: 0, dataSource: dataSource))

        assertVisible(.text(alertTitle))
        assertVisible(.text(alertMessage))
        assertVisible(.text(alertOkButton))

        tap(.text(alertOkButton))
    }
}
