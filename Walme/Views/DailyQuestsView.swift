//
//  DailyQuestsView.swift
//  Walme
//
//  Created by Dason Tiovino on 18/06/24.
//

import Foundation
import SwiftUI

struct DailyQuestsView: View {
    @StateObject private var viewModel = DailyQuestsViewModel()
    
    private var progressValue: Double {
        min(max(viewModel.stepCount, 0), viewModel.stepCountGoal)
    }
    
    var body: some View {
        VStack {
            DatePicker(
                "Select a Date",
                selection: $viewModel.selectedDate,
                displayedComponents: [.date]
            ).datePickerStyle(.graphical)
            
            PersonalProgress(
                name: "Rangga",
                step: viewModel.stepCount,
                total: viewModel.stepCountGoal
            )
            
            Slider(value: $viewModel.stepCount, in: 0...2000).padding()
            
            Text("Steps: \(Int(viewModel.stepCount))")
        }
    }
}

#Preview {
    DailyQuestsView()
}
