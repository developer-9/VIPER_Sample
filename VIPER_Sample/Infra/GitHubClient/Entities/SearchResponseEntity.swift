//
//  SearchResponseEntity.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/10.
//

import Foundation

struct SearchResponseEntity<Item: Decodable>: Decodable {
    let totalCount: Int
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
