import Foundation

struct SearchResultModel: SearchResultModelProtocol {
    var artistName: String?
    var trackName: String?
    var imageURL: URL?
    var trackId: Int64?

    init(entity: ItunesElement) {
        self.artistName = entity.artistName
        self.trackName = entity.trackName
        self.trackId = entity.trackId
        if let urlString = entity.artworkUrl60, let url = URL(string: urlString) {
            self.imageURL = url
        } else {
            self.imageURL = nil
        }
    }
}
