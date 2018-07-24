import XCTest
import Sencha
import EarlGrey

extension XCTestCase {
    public func type(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        EarlGrey.selectElement(with: matcher.greyMatcher(), file: file, line: line).perform(grey_typeText(text))
    }

    public func replace(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        EarlGrey.selectElement(with: matcher.greyMatcher(), file: file, line: line).perform(grey_replaceText(text))
    }
}
