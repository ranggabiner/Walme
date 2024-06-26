//
//  MainTabView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct MainTabView: View {
    @Binding var appUser: User?
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            DailyQuestsView()
                .tabItem (){
                    Image(selectedTab == 0 ? "quest" : "quest_unselected")
                    Text("Quest")
                }
                .tag(0)
            LeaderboardView()
                .tabItem (){
                    Image(selectedTab == 1 ? "trophy" : "trophy_unselected")
                    Text("Leaderboard")
                }
                .tag(1)
        }
    }
}

#Preview {
    MainTabView(appUser: .constant(User(id: "1234")))
}
