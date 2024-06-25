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
    @Published var isGoalCompleted: Bool = false
    @Published var stepCountGoal: Double = 2000.0
    @Published var stepCount: Double = 0.0
    @Published var selectedDate: Date = Date()
    
    private var healthStore = HealthService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
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
