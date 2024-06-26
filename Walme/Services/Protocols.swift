//
//  Protocols.swift
//  Walme
//
//  Created by robert theo on 26/06/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchLeaderboard() async throws -> [LeaderBoard]
}

enum APIError: Error {
    case invalidResponse
    case decodingError(Error)
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            return "Invalid response from server."
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}
