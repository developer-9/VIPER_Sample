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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RepositorySearchResultViewController: RepositorySearchResultView {
    
}
