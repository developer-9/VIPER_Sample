//
//  RepositorySearchResultPresentation.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/05.
//

import Foundation

protocol RepositorySearchResultPresentation: AnyObject {
    
}

final class RepositorySearchResultPresenter {
    
    // View, Interactor, Routerへのアクセスはprotocolを介して行う
    // Viewは循環参照にならないようにweakにする
    private weak var view: RepositorySearchResultView?
    private let router: RepositorySearchResultWireframe
    private let searchRepositoryInteractor: SearchRepositoryUsecase
 
    init(view: RepositorySearchResultView,
         router: RepositorySearchResultWireframe,
         searchRepositoryInteractor: SearchRepositoryUsecase) {
        self.view = view
        self.router = router
        self.searchRepositoryInteractor = searchRepositoryInteractor
    }
}
