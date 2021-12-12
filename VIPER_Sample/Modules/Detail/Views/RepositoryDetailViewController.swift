//
//  RepositoryDetailViewController.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/12.
//

import UIKit
import WebKit

protocol RepositoryDetailView: AnyObject {
    
}

final class RepositoryDetailViewController: UIViewController {
    
    var presenter: RepositoryDetailViewPresentation!
}

extension RepositoryDetailViewController: RepositoryDetailView {
    
}
