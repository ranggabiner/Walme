//
//  SignInView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    @Binding var appUser: Users?
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await viewModel.signInWithApple()
                    if viewModel.appUser != nil {
                        appUser = viewModel.appUser
                    }
                }
            } label: {
                Text("Sign in with Apple")
                    .foregroundStyle(Color(.black))
            }
        }
        .padding()
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    SignInView(appUser: .constant(.init(id: "1234", email: "jajang@gmail.com", name: "Jajang")))
}
