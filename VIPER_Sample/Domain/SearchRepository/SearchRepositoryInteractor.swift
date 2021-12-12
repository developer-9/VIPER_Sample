//
//  SearchRepositoryUsecase.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/05.
//

import Foundation

protocol SearchRepositoryUsecase: AnyObject {
    func fetchRepositories(keyword: String, completion: @escaping(Result<[RepositoryEntity], Error>) -> Void)
}

final class SearchRepositoryInteractor {
    // GitHubにアクセスするためのAPIクライアント
    // テスト時にAPIクライアントをMockに差し替えてレスポンスを返すようにする
    private let client: GitHubRequestable
    
    init(client: GitHubRequestable = GitHubClient()) {
        self.client = client
    }
}

// Interactorのプロトコルに準拠する
extension SearchRepositoryInteractor: SearchRepositoryUsecase {
    func fetchRepositories(keyword: String, completion: @escaping (Result<[RepositoryEntity], Error>) -> Void) {
        let request = GitHubAPI.SearchRepositories(keyword: keyword)
        client.send(request: request) { result in
            completion(result.map { $0.items })
        }
    }
}
