//
//  LeaderboardView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct LeaderboardView: View {
    @StateObject private var model = LeaderboadViewModel()
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            ZStack{
                Image("leaderboard")
                VStack {
                    HStack(alignment: .bottom, spacing: 0 ) {

                        ZStack {

                            Rectangle()
                                .frame(width: 104, height: 202)
                                .foregroundColor(.ranking2)
                            VStack {
                                Image("ranking2top").offset(CGSize(width: 0, height: -63.5))
                                Text("2")
                                    .foregroundColor(.white)
                                    .padding(UIConfig.Paddings.large)
                                    .fontWeight(.semibold)
                                    .font(.title)
                                Text(Strings.Leaderboard.teamMentor)
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)                            }
                        }
                        ZStack {
                            Rectangle()
                                .frame(width: 110, height: 246)
                            .foregroundColor(.ranking1)
                            VStack {
                                Image("ranking1top").offset(CGSize(width: 0, height: -84.0))
                                Text("1")
                                    .foregroundColor(.white)
                                    .padding(UIConfig.Paddings.large)
                                    .fontWeight(.semibold)
                                    .font(.title)
                                Text(Strings.Leaderboard.sixNakama)
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)                            }
                        }
                        ZStack {
                            Rectangle()
                                .frame(width: 104, height: 150)
                            .foregroundColor(.ranking3)
                            VStack {
                                Image("ranking3top").offset(CGSize(width: 0, height: -35.5))
                                Text("3")
                                    .foregroundColor(.white)
                                    .padding(UIConfig.Paddings.large)
                                    .fontWeight(.semibold)
                                    .font(.title)
                                Text(Strings.Leaderboard.teamPeta)
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                }
            }
            ZStack {
                Card(fillColor: .white, strokeColor: .strokeColor1, lineWidth: 3, radius: 12) {
                    HStack {
                        Image("avatar-leaderboard")
                        Text("These are the clan who are the most ardent to our missions.")
                    }
                }.frame(width: 360, height: 60)
            }.offset(CGSize(width: 0, height: -120.0))

            
            LazyVGrid(columns: columns) {             ForEach(Array(model.leaderboards.enumerated()), id: \.element.id) { index, leaderboard in
                    Card(strokeColor: .strokeColor1) {
                        VStack {
                            HStack{
                                Text("\(index+1)")
                                Text(leaderboard.clanName)
                                Spacer()
                                Image("treecount")
                            }
                        }
                    }
                    .frame(width: 360, height: 60)
                    .padding(UIConfig.Paddings.normal)
                }
            }
            .padding(UIConfig.Paddings.huge)
            .task {
                await model.fetchLeaderboards()
            }
            .offset(CGSize(width: 0, height: -120.0))
        }.ignoresSafeArea()
    }
}

#Preview {
    LeaderboardView()
}
