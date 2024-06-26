//
//  LeaderboadViewModel.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import Foundation

class LeaderboadViewModel: ObservableObject {
    private let apiService: APIServiceProtocol
    @Published var leaderboards: [LeaderBoard] = []
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    @MainActor
    func fetchLeaderboards() async {
        do {
            leaderboards = try await apiService.fetchLeaderboard()
            print("model view")
            print(leaderboards)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

