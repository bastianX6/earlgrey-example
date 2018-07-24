import Foundation
@testable import EarlGreyExample

class MockUtils {
    internal class func getDataFromJsonFile(named name: String) -> Data? {
        let testBundle = Bundle(for: MockUtils.self)
        if let filePath = testBundle.url(forResource: name, withExtension: "json") {
            do {
                return try Data(contentsOf: filePath)
            } catch {
                debugPrint("error:\(error)")
                return nil
            }
        }
        return nil
    }

    class func getCodableFromResource<T: Codable>(named name: String, type: T.Type) -> T? {
        guard let data = self.getDataFromJsonFile(named: name) else { return nil }
        guard let object = try? JSONDecoder().decode(type, from: data) else { return nil }
        return object
    }

    class func getDetailResultModel(from response: ItunesSearchResponse) -> DetailResultModelProtocol? {
        guard let firstElement = response.results?.first else { return nil }
        return DetailResultModel(entity: firstElement)
    }
}
