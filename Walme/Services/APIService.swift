//
//  APIService.swift
//  Walme
//
//  Created by robert theo on 26/06/24.
//

import Foundation

class APIService: APIServiceProtocol {
    func fetchLeaderboard() async throws -> [LeaderBoard] {
        try await loadLeaderboardsFromFile()
    }

    
    private func loadLeaderboardsFromFile() async throws -> [LeaderBoard] {
        guard let url = Bundle.main.url(forResource: "DummyDataLeaderboard", withExtension: "json") else {
            throw APIError.invalidResponse
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let leaderboards = try decoder.decode([LeaderBoard].self, from: data)
            return leaderboards
        } catch {
            throw APIError.decodingError(error)
        }
    }
}
