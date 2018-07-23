import Foundation

struct SearchResultModel: SearchResultModelProtocol {
    var artistName: String?
    var trackName: String?
    var imageURL: URL?

    init(entity: ItunesElement) {
        self.artistName = entity.artistName
        self.trackName = entity.trackName
        if let urlString = entity.artworkUrl60, let url = URL(string: urlString) {
            self.imageURL = url
        } else {
            self.imageURL = nil
        }
    }
}
