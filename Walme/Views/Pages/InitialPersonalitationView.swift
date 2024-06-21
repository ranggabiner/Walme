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
        VStack(spacing: UIConfig.Spacings.large) {
            
            InputText(
                textField: Strings.PersonalizeGoal.nickName,
                field: $viewModel.nickname,
                showError: viewModel.showNicknameError,
                errorMessage: Strings.PersonalizeGoal.nickName
            )

            InputText(
                textField: Strings.PersonalizeGoal.setYourDailyGoal,
                field: $viewModel.dailySteps,
                showError: viewModel.showStepsError,
                errorMessage: Strings.PersonalizeGoal.stepsError
            )
            .keyboardType(.numberPad)
            
            ButtonAction(
                buttonText: Strings.PersonalizeGoal.startActivity,
                textColor: .white,
                rectanglePrimaryColor: Color(red: 0.92, green: 0.69, blue: 0.17),
                rectangleSecondaryColor: Color(red: 1, green: 0.75, blue: 0.19),
                strokeColor: .white,
                buttonWidth: .long,
                action: {
                    Task {
                        await viewModel.startActivity()
                        if viewModel.isActivityStarted {
                            isActivityStarted = true
                        }
                    }
                },
                buttonImage: .none
            )
        }
        .padding(UIConfig.Paddings.huge)
    }
}

#Preview {
    InitialPersonalitationView(viewModel: InitialPersonalitationViewModel(appUser: .init(id: "1234")), appUser: .constant(.init(id: "1234")), isActivityStarted: .constant(false))
}
