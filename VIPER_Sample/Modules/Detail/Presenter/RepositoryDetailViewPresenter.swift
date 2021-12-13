//
//  RepositoryDetailViewPresenter.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/13.
//

import Foundation

protocol RepositoryDetailViewPresentation: AnyObject {
    func viewDidLoad()
}

final class RepositoryDetailViewPresenter {
    
    private weak var view: RepositoryDetailView?
    private let router: RepositoryDetailWireframe
    private let repository: RepositoryEntity
    
    init(view: RepositoryDetailView, router: RepositoryDetailWireframe, repository: RepositoryEntity) {
        self.view = view
        self.router = router
        self.repository = repository
    }
}

extension RepositoryDetailViewPresenter: RepositoryDetailViewPresentation {
    func viewDidLoad() {
        view?.load(request: URLRequest(url: repository.htmlUrl))
    }
}
