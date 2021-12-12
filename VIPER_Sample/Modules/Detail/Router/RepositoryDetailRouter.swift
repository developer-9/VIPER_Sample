//
//  RepositoryDetailRouter.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/07.
//

import UIKit

protocol RepositoryDetailWireframe: AnyObject {
    
}

final class RepositoryDetailRouter {
    // 画面遷移のためにViewControllerが必要。initで受け取る
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // DI
    static func assembleModules(repository: RepositoryEntity) -> UIViewController {
        let view = RepositoryDetailViewController()
        let router = RepositoryDetailRouter(viewController: view)
        let presenter = RepositoryDetailViewPresenter(view: view, router: router, repository: repository)
        
        view.presenter = presenter
        return view
    }
}

extension RepositoryDetailRouter: RepositoryDetailWireframe {
    
}
