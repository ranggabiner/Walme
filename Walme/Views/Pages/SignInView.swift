//
//  SignInView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    @Binding var appUser: User?

    var body: some View {
        VStack {
            ButtonAction(
                buttonText: Strings.Login.continueWithApple,
                textColor: .white,
                rectanglePrimaryColor: Color(.black),
                rectangleSecondaryColor: Color(red: 0.25, green: 0.25, blue: 0.25),
                strokeColor: .white,
                buttonWidth: .long,
                action: {
                    Task {
                        await viewModel.signInWithApple()
                        if viewModel.appUser != nil {
                            appUser = viewModel.appUser
                        }
                    }
                },
                buttonImage: .system(name: Strings.Login.logo)
            )
        }
        .padding(UIConfig.Paddings.huge)
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    SignInView(appUser: .constant(.init(id: "1234", email: "jajang@gmail.com", nickname: "Jajang")))
}

