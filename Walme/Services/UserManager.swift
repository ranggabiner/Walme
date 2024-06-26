//
//  UserManager.swift
//  Walme
//
//  Created by Rangga Biner on 18/06/24.
//

import Foundation
import Supabase

class UserManager {
    static let shared = UserManager()
    
    private init() {}
    
    let client = SupabaseService().client
    
    func getCurrentSession() async throws -> User {
        let session = try await client.auth.session
        return User(id: session.user.id.uuidString, email: session.user.email)
    }
    
    func signInWithApple(idToken: String, nonce: String) async throws -> User {
        let session = try await client.auth.signInWithIdToken(credentials: .init(provider: .apple, idToken: idToken, nonce: nonce))
        return User(id: session.user.id.uuidString, email: session.user.email)
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
    }
    
    func insertPersonalitation(_ username: User) async throws -> Bool {
        let insertResponse = try await client.database.from("users").insert(username).execute()
        return insertResponse.status == 201
    }
}
