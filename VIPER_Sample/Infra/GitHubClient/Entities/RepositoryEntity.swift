//
//  RepositoryEntity.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/05.
//

import Foundation

struct RepositoryEntity: Decodable {
    let id: Int
    let name: String
    let fullname: String
    let htmlUrl: URL
    let starCount: Int
    let owner: UserEntity
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullname = "full_name"
        case htmlUrl = "html_url"
        case starCount = "stargazers_count"
        case owner
    }
}
