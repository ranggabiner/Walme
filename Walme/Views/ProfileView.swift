//
//  ProfileView.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import Foundation
import Supabase
import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var appUser: Users?
    @State private var nameResult: String = ""

    let client = SupabaseClient(supabaseURL: URL(string: "https://zhlzvjdfjqpffnlnsqvs.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpobHp2amRmanFwZmZubG5zcXZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg3MTIwODEsImV4cCI6MjAzNDI4ODA4MX0.4W1SIHR7UCysA9h8t_j8gceqEsGPlNeMrEKFOux92C0")

    var body: some View {
        VStack {
            Text(viewModel.appUser?.id ?? "No User ID")
            Text(viewModel.appUser?.email ?? "No Email")
            Text(nameResult)

            Button(action: {
                Task {
                    await viewModel.signOut()
                    appUser = nil
                }
            }) {
                Text("Logout")
                    .foregroundColor(.red)
            }
            .padding()
        }
        .onAppear {
            fetchUserNameById()
        }
        .onChange(of: appUser?.nickname) { newName in
            if let newName = newName {
                nameResult = newName
            }
        }
    }

    private func fetchUserNameById() {
        Task {
            do {
                let response = try await client.database.from("users").select().eq("id", value: viewModel.appUser?.id).execute()
                
                guard response.status == 200 else {
                    nameResult = "Not Found"
                    return
                }
                
                guard let data = response.data as? Data else {
                    nameResult = "Not Found"
                    return
                }
                
                guard !data.isEmpty else {
                    nameResult = "Not Found"
                    return
                }
                
                if let user = try? JSONDecoder().decode([Users].self, from: data), let firstName = user.first {
                    nameResult = firstName.nickname ?? "No Name"
                } else {
                    nameResult = "Not Foundddd"
                }
            } catch {
                print("Error searching group: \(error.localizedDescription)")
                nameResult = "Error"
            }
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(appUser: .init(id: "1234", email: "jajang@gmail.com", nickname: "Jajang")), appUser: .constant(.init(id: "1234", email: "jajang@gmail.com", nickname: "Jajang")))
}
