//
//  MainTabView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct MainTabView: View {
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
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
