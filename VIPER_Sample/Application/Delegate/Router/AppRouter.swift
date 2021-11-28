//
//  AppRouter.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/11/28.
//

import UIKit

protocol AppWireframe: AnyObject {
    func showRepositorySearchResultView()
}

final class AppRouter {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    static func assembleModules(window: UIWindow) -> AppPresentation {
        let router = AppRouter(window: window)
        let presenter = AppPresenter(router: router)
        return presenter
    }
}

extension AppRouter: AppWireframe {
    func showRepositorySearchResultView() {
        let searchResultView = searchresult
    }
}
