import Foundation
import Alamofire

class ItunesDataSoruce: ItunesDataSourceProtocol {
    private let searchUrl = "https://itunes.apple.com/search"
    private let lookupUrl = "https://itunes.apple.com/lookup"

    func getSearchResults(for text: String, success: @escaping (ItunesSearchResponse) -> Void, failure: @escaping (Error) -> Void) {
        let text = text.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: self.searchUrl)!
        let params =  [
            "term" : text
        ]

        Alamofire
            .request(url, method: .get, parameters: params, encoding: URLEncoding.default)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    if let itunesResponse = try? JSONDecoder().decode(ItunesSearchResponse.self, from: data) {
                        success(itunesResponse)
                    } else {
                        failure(ItunesDataSourceError.parseError)
                    }
                case .failure(let responseError):
                    failure(responseError)
                }
        }
    }
}
