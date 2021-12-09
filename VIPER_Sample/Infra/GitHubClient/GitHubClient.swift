//
//  GitHubClient.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/09.
//

import Foundation

protocol GitHubRequestable: AnyObject {
    func send<Request: GitHubRequest>(request: Request, completion: @escaping(Result<Request.Response, Error>) -> ())
}

class GitHubClient {
    
    private let session: URLSession
    
    init(session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    ) {
        self.session = session
    }
}

extension GitHubClient: GitHubRequestable {
    func send<Request>(request: Request, completion: @escaping (Result<Request.Response, Error>) -> ()) where Request : GitHubRequest {
        <#code#>
    }
}
