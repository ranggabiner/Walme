//
//  ProfileViewModel.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var appUser: User?
    @Published var isActivityStarted: Bool = false
    
    private let userManager = UserManager.shared

    init(appUser: User?) {
        self.appUser = appUser
    }
    
    func signOut() async {
        do {
            try await UserManager.shared.signOut()
            DispatchQueue.main.async {
                self.appUser = nil
            }
        } catch {
            print("Error signing out: \(error)")
        }
    }
}
