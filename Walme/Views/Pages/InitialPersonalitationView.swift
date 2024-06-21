//
//  InitialPersonalitationView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct InitialPersonalitationView: View {
    @ObservedObject var viewModel: InitialPersonalitationViewModel
    @Binding var appUser: Users?
    @Binding var isActivityStarted: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Set your daily steps")

            InputText(
                textField: "Nickname",
                field: $viewModel.nickname,
                showError: viewModel.showNicknameError,
                errorMessage: "Required Nickname"
            )

            InputText(
                textField: "Set your daily steps",
                field: $viewModel.dailySteps,
                showError: viewModel.showStepsError,
                errorMessage: "Required minimum steps is 2000"
            )
            .keyboardType(.numberPad)

            Button(action: {
                Task {
                    await viewModel.startActivity()
                    if viewModel.isActivityStarted {
                        isActivityStarted = true
                    }
                }
            }) {
                Text("Start Activity")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    InitialPersonalitationView(viewModel: InitialPersonalitationViewModel(appUser: .init(id: "1234")), appUser: .constant(.init(id: "1234")), isActivityStarted: .constant(false))
}
