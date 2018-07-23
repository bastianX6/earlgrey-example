import Foundation

struct ItunesSearchResponse: Codable {
    let resultCount: Int?
    let results: [ItunesElement]?

    private enum ItunesSearchResponseKeys: String, CodingKey {
        case resultCount
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ItunesSearchResponseKeys.self)

        self.resultCount = try container.decodeIfPresent(Int.self, forKey: .resultCount)
        self.results = try container.decodeIfPresent([ItunesElement].self, forKey: .results)
    }
}
