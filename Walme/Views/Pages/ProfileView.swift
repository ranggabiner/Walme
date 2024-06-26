//
//  ProfileView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var appUser: User?

    var body: some View {
            Button(action: {
                Task {
                    await viewModel.signOut()
                    appUser = nil
                }
            }) {
                Text("Logout")
                    .foregroundColor(.red)
            }
        }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(appUser: .init(id: "1234")), appUser: .constant(.init(id: "1234")))
}
