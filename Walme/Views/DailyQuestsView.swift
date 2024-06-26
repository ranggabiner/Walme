//
//  DailyQuestsView.swift
//  Walme
//
//  Created by Dason Tiovino on 18/06/24.
//

import Foundation
import SwiftUI

extension Date{
    func formattedString()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}

struct DailyQuestsView: View {
    @StateObject private var viewModel = DailyQuestsViewModel()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                HomeHeader(
                    clanName: "Six Nakama",
                    name: viewModel.user?.nickname ?? "Rangga",
                    date: viewModel.selectedDate.formattedString())

                TreeProgress(clanName: "Six Nakama", progress: progressValueToEnum)

                PersonalProgress(
                    name: viewModel.user?.nickname ?? "Rangga",
                    step: viewModel.stepCount,
                    total: viewModel.stepCountGoal
                )
                
                ForEach(viewModel.teammatesData){user in
                    TeammateProgress(user: user)
                }
            }
            .padding()
        }.background(.appBackground)
            
    }
    
    private var progressValue: Double {
        min(max(viewModel.stepCount, 0), viewModel.stepCountGoal)
    }
    
    private var progressValueToEnum: ProgressPercentage{
        let teammatesCount = viewModel.teammatesData.count
        let completedTeammatesCount = viewModel.teammatesData.filter{$0.isCompleted == true}.count
        if(completedTeammatesCount == teammatesCount){
            return .progress100
        }else if(completedTeammatesCount >= (teammatesCount * 4) / 5){
            return .progress75
        }else if(completedTeammatesCount >= (teammatesCount * 3) / 5){
            return .progress50
        }else if(completedTeammatesCount >= (teammatesCount * 2) / 5){
            return .progress25
        }else{
            return .progress0
        }
    }
}

#Preview {
    DailyQuestsView()
}
