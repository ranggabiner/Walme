//
//  User.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var email: String?
    var nickname: String?
    var dailyStepGoals: String?
    var dailyStep: String?
    var isCompleted: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case nickname
        case dailyStepGoals = "daily_steps_goal"
        case dailyStep = "daily_steps"
        case isCompleted = "is_completed"
    }
}
