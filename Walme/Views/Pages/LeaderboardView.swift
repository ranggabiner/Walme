//
//  LeaderboardView.swift
//  Walme
//
//  Created by robert theo on 26/06/24.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        Image("leaderboard")
        Card {
            Image("leaderboard")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity)
        }
        .padding(UIConfig.Paddings.normal16)
        .strikethrough()
        
    }
}

#Preview {
    LeaderboardView()
}
