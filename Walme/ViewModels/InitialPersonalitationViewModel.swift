//
//  InitialPersonalitationViewModel.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI
import Combine

class InitialPersonalitationViewModel: ObservableObject {
    @Published var appUser: Users?
    @Published var nickname: String = ""
    @Published var dailySteps: String = ""
    @Published var showNicknameError: Bool = false
    @Published var isCompleted: Bool = false
    @Published var showStepsError: Bool = false
    var alertMessage: String = ""
    
    private let userManager = UserManager.shared

    init(appUser: Users?) {
        self.appUser = appUser
    }

    
    func validateNickname() {
        showNicknameError = nickname.isEmpty
    }
    
    func validateSteps() {
        if let steps = Int(dailySteps) {
            showStepsError = steps < 2000
        } else {
            showStepsError = true
        }
    }

    func startActivity() async {
        validateNickname()
        validateSteps()
        
        if showNicknameError {
            alertMessage = "Required Nickname"
        } else if showStepsError {
            alertMessage = "Required minimum steps is 2000"
        } else {
            guard let userId = appUser?.id else {
                print("User ID not available")
                return
            }
            
            guard let userEmail = appUser?.email else {
                print("User Email not available")
                return
            }
            
            let newUser = Users(id: userId, email: userEmail, nickname: nickname, dailyStepGoals: dailySteps, isCompleted: isCompleted)
            
            do {
                let isSuccess = try await userManager.insertNickname(newUser)
                    
                if isSuccess {
                    appUser?.nickname = nickname
                } else {
                    print("Failed to create user")
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
