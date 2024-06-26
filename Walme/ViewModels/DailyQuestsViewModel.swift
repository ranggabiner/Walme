//
//  DailyQuestViewModel.swift
//  walkapp
//
//  Created by Dason Tiovino on 18/06/24.
//

import Foundation
import SwiftUI
import Combine

class DailyQuestsViewModel: ObservableObject {
    var user = UserManager.shared.getAuthenticatedUser()

    @Published var isGoalCompleted: Bool = false
    @Published var stepCountGoal: Double = 2000
    @Published var stepCount: Double = 0.0
    @Published var selectedDate: Date = Date()
    
    @Published var teammatesData: [User] = [
        User(
            id: UUID().uuidString,
            email: "rizki@gmail.com",
            nickname: "Rizki",
            dailyStepGoals: "2000",
            dailyStep: "2000",
            isCompleted: true
        ),
        User(
            id: UUID().uuidString,
            email: "ferry@gmail.com",
            nickname: "Ferry",
            dailyStepGoals: "2000",
            dailyStep: "1250",
            isCompleted: false
        ),
        User(
            id: UUID().uuidString,
            email: "hans@gmail.com",
            nickname: "Hans",
            dailyStepGoals: "2000",
            dailyStep: "2000",
            isCompleted: true
        ),
        User(
            id: UUID().uuidString,
            email: "robert@gmail.com",
            nickname: "Robert",
            dailyStepGoals: "2000",
            dailyStep: "800",
            isCompleted: false
        ),
    ]
    
    private var healthStore = HealthService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.stepCountGoal = Double(user?.dailyStepGoals ?? "2000.0")!
        healthStore.requestAuthorization{ success in
            self.fetchStepCount(for: self.selectedDate)
        }
        
        $selectedDate
            // subscribe selectedDate & run function if selectedDate changed
            .sink { [weak self] newDate in
                self?.fetchStepCount(for: newDate)
            }
            // prevent memory leaks
            .store(in: &cancellables)
    }
    
    private func fetchStepCount(for date: Date) {
        healthStore.fetchStepCount(for: date) { [weak self] count in
            DispatchQueue.main.async {
                self?.stepCount = count
                self?.isGoalCompleted = count >= self?.stepCountGoal ?? 2000.0
            }
        }
    }
}
