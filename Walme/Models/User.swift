//
//  User.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

struct Users: Codable {
    var id: String
    var email: String?
    var name: String?
    var dailyStepsGoal: Int?
    var isCompleted: Bool?
}
