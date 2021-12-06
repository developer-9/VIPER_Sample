//
//  RepositorySearchResultViewController.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/05.
//

import UIKit

protocol RepositorySearchResultView: AnyObject {
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
    }
}

extension RepositorySearchResultViewController: RepositorySearchResultView {
    
}
