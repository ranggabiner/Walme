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
                HStack {
                    Image(systemName: "applelogo")
                        .foregroundColor(.white)
                    Text("Continue with Apple")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .cornerRadius(25)
            }
        }
        .padding()
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    SignInView(appUser: .constant(.init(id: "1234", email: "jajang@gmail.com", nickname: "Jajang")))
}
