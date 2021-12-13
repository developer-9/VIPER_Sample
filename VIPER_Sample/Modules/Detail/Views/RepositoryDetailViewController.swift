//
//  RepositoryDetailViewController.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/12.
//

import UIKit
import WebKit

protocol RepositoryDetailView: AnyObject {
    func load(request urlRequest: URLRequest)
}

final class RepositoryDetailViewController: UIViewController {
    
    var presenter: RepositoryDetailViewPresentation!
    
    @IBOutlet private weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension RepositoryDetailViewController: RepositoryDetailView {
    func load(request urlRequest: URLRequest) {
        webView.load(urlRequest)
    }
}
