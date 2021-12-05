//
//  RepositorySearchResultRouter.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/11/29.
//

import UIKit

protocol RepositorySearchResultWireframe: AnyObject {
}

final class RepositorySearchResultRouter {
    // 画面遷移のためにViewControllerが必要。initで受け取る
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // DI
    static func assembleModules() -> UIViewController {
        let view = RepositorySearchResultViewController()
        let router = RepositorySearchResultRouter(viewController: view)
        let searchRepositoryInteractor = SearchRepositoryInteractor()
        // PresenterはView, Interactor, Routerそれぞれ必要なので生成initの引数で渡す
        let presenter = RepositorySearchResultPresenter
        
    }
}
