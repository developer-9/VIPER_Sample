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
    func send<Request: GitHubRequest>(request: Request, completion: @escaping (Result<Request.Response, Error>) -> ()) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) { data, response, error in
            switch (data, response, error) {
            case (_, _, let error?):
                print(error.localizedDescription)
                completion(.failure(error))
            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(.success(response))
                } catch {
                    completion(.failure(NSError()))
                }
            default:
                completion(.failure(NSError()))
            }
        }
        task.resume()
    }
}
