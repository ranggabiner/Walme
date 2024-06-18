//
//  User.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import Foundation

struct Users: Codable {
    var id: String
    var email: String?
    var nickname: String?
    var dailyStepGoals: String?
    var isCompleted: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case nickname
        case dailyStepGoals = "daily_steps_goal" // Sesuaikan dengan nama kolom di database
        case isCompleted = "is_completed" // Sesuaikan dengan nama kolom di database
    }
}
