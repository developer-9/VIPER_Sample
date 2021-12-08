//
//  RepositorySearchResultPresentation.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/05.
//

import Foundation

protocol RepositorySearchResultPresentation: AnyObject {
    func searchButtonDidPush(searchText: String)
    func didSelect(repository: RepositoryEntity)
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

extension RepositorySearchResultPresenter: RepositorySearchResultPresentation {
    func searchButtonDidPush(searchText: String) {
        guard !searchText.isEmpty else { return }
        // Interactorにデータ取得処理を依頼
        searchRepositoryInteractor.fetchRepositories(keyword: searchText) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let repositories):
                self.view?.updateRepositories(repositories)
            case .failure(_):
                self.view?.showErrorAlert()
            }
        }
    }
    
    func didSelect(repository: RepositoryEntity) {
        router.showRepositoryDetail(repository)
    }
}
