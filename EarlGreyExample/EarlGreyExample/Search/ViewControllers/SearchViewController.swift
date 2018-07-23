import UIKit

class SearchViewController: UIViewController {
    var presenter: SearchPresenterProtocol?

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    internal var elements: [SearchResultModelProtocol]  = []

    convenience init(presenter: SearchPresenterProtocol) {
        self.init(nibName: SearchViewController.nameOfClass, bundle: nil)
        self.presenter = presenter
    }

    // MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    private func setupTableView() {
        self.tableView.register(SearchTableViewCell.nib, forCellReuseIdentifier: SearchTableViewCell.reusableIdentifier)
        let view = UIView()
        view.backgroundColor = .white
        self.tableView.tableFooterView = view
    }
}

extension SearchViewController: SearchViewProtocol {
    func setElements(_ elements: [SearchResultModelProtocol]) {
        self.elements = elements
        self.tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.elements.count > 0 && indexPath.row < self.elements.count else { return }
        let element = self.elements[indexPath.row]
        self.presenter?.cellTapped(model: element)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SearchTableViewCell.height
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return SearchTableViewCell.estimatedHeight
    }
}

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reusableIdentifier) as? SearchTableViewCell else {
            return UITableViewCell()
        }

        if self.elements.count > 0 && indexPath.row < self.elements.count {
            let element = self.elements[indexPath.row]
            cell.setupCell(artistName: element.artistName, trackName: element.trackName, url: element.imageURL)
        }

        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.presenter?.searchButtonTapped(text: searchBar.text ?? "")
    }
}
