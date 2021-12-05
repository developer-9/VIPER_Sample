//
//  RepositorySearchResultRouter.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/11/29.
//

import UIKit

protocol RepositorySearchResultWireframe: AnyObject {
    func showRepositoryDetail(_ repository: RepositoryEntity)
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
        let presenter = RepositorySearchResultPresenter(view: view,
                                                        router: router,
                                                        searchRepositoryInteractor: searchRepositoryInteractor)
        
        view.presenter = presenter  // ViewにPresenterを設定
        return view
    }
}

// Routerのprotocolに準拠する
// 遷移する各画面ごとにメソッドを定義
extension RepositorySearchResultRouter: RepositorySearchResultWireframe {
    func showRepositoryDetail(_ repository: RepositoryEntity) {
        
    }
}
