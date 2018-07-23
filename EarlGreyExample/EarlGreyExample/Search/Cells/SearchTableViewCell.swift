import UIKit
import SDWebImage

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var artistImageView: UIImageView!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var trackNameLabel: UILabel!
    static let height: CGFloat = UITableViewAutomaticDimension
    static let estimatedHeight: CGFloat = 75.0

    override func prepareForReuse() {
        super.prepareForReuse()
        self.artistImageView.image = nil
        self.artistNameLabel.text = nil
    }

    func setupCell(artistName: String?, trackName: String? , url: URL?) {
        artistNameLabel.text = artistName
        trackNameLabel.text = trackName
        artistImageView.sd_setImage(with: url)
    }
}
