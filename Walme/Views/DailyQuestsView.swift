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
                
            ProgressView(value: progressValue, total: viewModel.stepCountGoal)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
            
            Text("Steps: \(Int(viewModel.stepCount))")
        }
    }
}

#Preview {
    DailyQuestsView()
}
