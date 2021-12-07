//
//  RepositorySearchResultViewController.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/05.
//

import UIKit

protocol RepositorySearchResultView: AnyObject {
    func updateRepositories(_ repositories: [RepositoryEntity])
    func showErrorAlert()
}

final class RepositorySearchResultViewController: UITableViewController {
    
    // Presneterへのアクセスはprorocolを介して行う
    var presenter: RepositorySearchResultPresentation!
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "リポジトリ名を入力.."
        searchBar.delegate = self
        return searchBar
    }()
    
    private var repositories: [RepositoryEntity] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        clearsSelectionOnViewWillAppear = true
        tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }
}

extension RepositorySearchResultViewController: RepositorySearchResultView {
    func updateRepositories(_ repositories: [RepositoryEntity]) {
        self.repositories = repositories
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "ネットワークエラー", message: "しばらく時間を置いてから再度お試しください", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}

extension RepositorySearchResultViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    }
}

extension RepositorySearchResultViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        //Presenterにイベント通知
        presenter.searchButtonDidPush(searchText: text)
        searchBar.resignFirstResponder()
    }
}
