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
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules(repository: RepositoryEntity) -> UIViewController {
    }
}
