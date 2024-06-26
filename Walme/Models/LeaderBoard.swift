//
//  LeaderBoard.swift
//  Walme
//
//  Created by robert theo on 26/06/24.
//

import Foundation

struct LeaderBoard: Codable, Identifiable {
    let id: String
    let ownerId: String
    let clanName: String
    let totalUser: Int
    let totalTree: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "clan_id"
        case ownerId = "owner_id"
        case clanName = "clan_name"
        case totalUser = "total_user"
        case totalTree = "total_tree"
    }
}
