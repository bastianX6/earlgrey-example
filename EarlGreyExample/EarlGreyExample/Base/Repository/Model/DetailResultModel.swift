import Foundation

struct DetailResultModel: DetailResultModelProtocol {
    var artistName: String?
    var trackName: String?
    var imageURL: URL?
    var trackId: Int64?
    var collectionName: String?

    init(entity: ItunesElement) {
        self.artistName = entity.artistName
        self.trackName = entity.trackName
        self.trackId = entity.trackId
        self.collectionName = entity.collectionName
        if let urlString = entity.artworkUrl100, let url = URL(string: urlString) {
            self.imageURL = url
        } else {
            self.imageURL = nil
        }
    }
}
