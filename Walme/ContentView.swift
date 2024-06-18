//
//  ContentView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var appUser: Users? = nil
    
    var body: some View {
        ZStack {
            if let appUser = appUser {
                if let personalitation = appUser.isCompleted {
//                    MainTabView(appUser: appUser)
                    InitialPersonalitationView(viewModel: InitialPersonalitationViewModel(appUser: appUser), viewModelProfile: ProfileViewModel(appUser: appUser), appUser: $appUser)
                    ProfileView(viewModel: ProfileViewModel(appUser: appUser), appUser: $appUser)

                } else {
                    VStack {
                        InitialPersonalitationView(viewModel: InitialPersonalitationViewModel(appUser: appUser), viewModelProfile: ProfileViewModel(appUser: appUser), appUser: $appUser)
                        ProfileView(viewModel: ProfileViewModel(appUser: appUser), appUser: $appUser)
                    }
                }
            } else {
                SignInView(appUser: $appUser)
            }
        }
        .onAppear {
            Task {
                self.appUser = try? await UserManager.shared.getCurrentSession()
            }
        }
    }
}

#Preview {
    ContentView()
}
