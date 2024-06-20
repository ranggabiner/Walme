//
//  MainTabView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct MainTabView: View {
    @Binding var appUser: Users?

    var body: some View {
        TabView {
            LeaderboardView()
                .tabItem {
                    Label("Leaderboard", systemImage: "trophy")
                }
            
            MyClanView()
                .tabItem {
                    Label("Clan", systemImage: "shield.checkered")
                }
            
            DailyQuestsView()
                .tabItem {
                    Label("Daily Quests", systemImage: "list.bullet.clipboard")
                }
            
            ProfileView(viewModel: ProfileViewModel(appUser: appUser), appUser: $appUser)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView(appUser: .constant(Users(id: "1234")))
}
