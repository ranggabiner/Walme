//
//  SignInViewModel.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var appUser: Users?
    @Published var errorMessage: String?
    @Published var showErrorAlert: Bool = false

    let authManager = UserManager.shared
    
    func signInWithApple() async {
        do {
            let appleResult = try await SignInApple().startSignInWithAppleFlow()
            let user = try await authManager.signInWithApple(idToken: appleResult.idToken, nonce: appleResult.nonce)
            DispatchQueue.main.async {
                self.appUser = user
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Error signing in with Apple: \(error.localizedDescription)"
                self.showErrorAlert = true
            }
        }
    }
}
