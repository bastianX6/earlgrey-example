import Foundation

struct ItunesElement: Codable {
    let wrapperType: String?
    let kind: String?
    let artistId: Int64?
    let collectionId: Int64?
    let trackId: Int64?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewUrl: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let collectionPrice: Float?
    let trackPrice: Float?
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Int64?
    let country: String?
    let currency: String?
    let primaryGenreName: String?

    private enum ItunesElementKeys: String, CodingKey {
        case wrapperType
        case kind
        case artistId
        case collectionId
        case trackId
        case artistName
        case collectionName
        case trackName
        case collectionCensoredName
        case trackCensoredName
        case artistViewUrl
        case collectionViewUrl
        case trackViewUrl
        case previewUrl
        case artworkUrl60
        case artworkUrl100
        case collectionPrice
        case trackPrice
        case collectionExplicitness
        case trackExplicitness
        case discCount
        case discNumber
        case trackCount
        case trackNumber
        case trackTimeMillis
        case country
        case currency
        case primaryGenreName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ItunesElementKeys.self)

        self.wrapperType = try container.decodeIfPresent(String.self, forKey: .wrapperType)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.artistName = try container.decodeIfPresent(String.self, forKey: .artistName)
        self.collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        self.trackName = try container.decodeIfPresent(String.self, forKey: .trackName)
        self.collectionCensoredName = try container.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        self.trackCensoredName = try container.decodeIfPresent(String.self, forKey: .trackCensoredName)
        self.artistViewUrl = try container.decodeIfPresent(String.self, forKey: .artistViewUrl)
        self.collectionViewUrl = try container.decodeIfPresent(String.self, forKey: .collectionViewUrl)
        self.trackViewUrl = try container.decodeIfPresent(String.self, forKey: .trackViewUrl)
        self.previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl)
        self.artworkUrl60 = try container.decodeIfPresent(String.self, forKey: .artworkUrl60)
        self.artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100)
        self.collectionExplicitness = try container.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        self.trackExplicitness = try container.decodeIfPresent(String.self, forKey: .trackExplicitness)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
        self.primaryGenreName = try container.decodeIfPresent(String.self, forKey: .primaryGenreName)

        self.artistId = try container.decodeIfPresent(Int64.self, forKey: .artistId)
        self.collectionId = try container.decodeIfPresent(Int64.self, forKey: .collectionId)
        self.trackId = try container.decodeIfPresent(Int64.self, forKey: .trackId)
        self.trackTimeMillis = try container.decodeIfPresent(Int64.self, forKey: .trackTimeMillis)

        self.discCount = try container.decodeIfPresent(Int.self, forKey: .discCount)
        self.discNumber = try container.decodeIfPresent(Int.self, forKey: .discNumber)
        self.trackCount = try container.decodeIfPresent(Int.self, forKey: .trackCount)
        self.trackNumber = try container.decodeIfPresent(Int.self, forKey: .trackNumber)

        self.collectionPrice = try container.decodeIfPresent(Float.self, forKey: .collectionPrice)
        self.trackPrice = try container.decodeIfPresent(Float.self, forKey: .trackPrice)
    }
}
