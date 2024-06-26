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
                                .frame(width: 110, height: 122)
                                .foregroundColor(.ranking2)
                            Text("asd")
                        }
                        Rectangle()
                            .frame(width: 110, height: 246)
                            .foregroundColor(.ranking1)
                        Rectangle()
                            .frame(width: 110, height: 150)
                            .foregroundColor(.ranking3)
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
            }
            
            LazyVGrid(columns: columns) {             ForEach(Array(model.leaderboards.enumerated()), id: \.element.id) { index, leaderboard in
                    Card(strokeColor: .strokeColor1) {
                        VStack {
                            HStack{
                                Text("\(index+1)")
//                                Ellipse()
//                                  .foregroundColor(.clear)
//                                  .frame(width: 24, height: 24)
//                                  .overlay(
//                                    Ellipse()
//                                      .inset(by: 0.75)
//                                      .stroke(Color(red: 0.83, green: 0.83, blue: 0.83), lineWidth: 0.75)
//                                  )
                                Text(leaderboard.clanName)
                                Spacer()
                                Card(radius: 12) {
                                    HStack(){
                                        Image("leaderboardTree").frame(width: 2, height: 2)
                                        
                                        Text("12")
                                    }
                                }.frame(width: 60, height: 32)
                            }
                        }
                    }
                    .frame(width: 360, height: 60)
                }
            }
            .task {
                await model.fetchLeaderboards()
            }

        }.ignoresSafeArea()
    }
}

#Preview {
    LeaderboardView()
}
