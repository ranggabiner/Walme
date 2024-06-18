//
//  InitialPersonalitationView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct InitialPersonalitationView: View {
    @ObservedObject var viewModel: InitialPersonalitationViewModel
    @ObservedObject var viewModelProfile: ProfileViewModel
    @Binding var appUser: Users?

    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Nickname", text: $viewModel.nickname)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(viewModel.showNicknameError ? Color.red : Color.gray, lineWidth: 1))
                .overlay(
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(Color.red)
                        .padding()
                        .opacity(viewModel.showNicknameError ? 1 : 0),
                    alignment: .trailing
                )
            
            if viewModel.showNicknameError {
                Text("Required Nickname")
                    .font(.footnote)
                    .foregroundColor(.red)
                    .padding(.leading)
            }
            
            TextField("Set your daily steps", text: $viewModel.dailySteps)
                .keyboardType(.numberPad)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(viewModel.showStepsError ? Color.red : Color.gray, lineWidth: 1))
                .overlay(
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(Color.red)
                        .padding()
                        .opacity(viewModel.showStepsError ? 1 : 0),
                    alignment: .trailing
                )
            
            if viewModel.showStepsError {
                Text("Required minimum steps is 2000")
                    .font(.footnote)
                    .foregroundColor(.red)
                    .padding(.leading)
            }
            
            Button(action: {
                Task {
                    await viewModel.startActivity()
                    if let updatedUser = viewModel.appUser {
                        appUser = updatedUser
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
            Button(action: {
                Task {
                    await viewModelProfile.signOut()
                    appUser = nil
                }
            }) {
                Text("Logout")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

#Preview {
    InitialPersonalitationView(viewModel: InitialPersonalitationViewModel(appUser: .init(id: "1234")), viewModelProfile: ProfileViewModel(appUser: .init(id: "123", email: "john@gmail.com", nickname: "John")), appUser: .constant(.init(id: "1234")))
}
