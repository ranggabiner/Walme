//
//  ContentView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var appUser: User? = nil
    @State var isActivityStarted: Bool = false

    var body: some View {
        ZStack {
            if let appUser = appUser {
                if isActivityStarted {
                    MainTabView(appUser: $appUser)
                } else {
                    InitialPersonalitationView(viewModel: InitialPersonalitationViewModel(appUser: appUser), appUser: $appUser, isActivityStarted: $isActivityStarted)
                }
            } else {
                SignInView(appUser: $appUser)
            }
        }
        .onAppear {
            Task {
                self.appUser = try? await UserManager.shared.getCurrentSession()
                self.isActivityStarted = UserDefaults.standard.bool(forKey: "isActivityStarted")
            }
        }
    }
}

#Preview {
    ContentView()
}

