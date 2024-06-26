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
    
    private let userKey = "authenticatedUser"
    
    let client = SupabaseService().client
    
    
    func getAuthenticatedUser() -> User? {
        let defaults = UserDefaults.standard
        if let savedUserData = defaults.data(forKey: userKey) {
            if let decodedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
                return decodedUser
            }
        }
        return nil
    }
    
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
    
    func insertPersonalitation(_ user: User) async throws -> Bool {
        let defaults = UserDefaults.standard
        if let encodedUser = try? JSONEncoder().encode(user) {
            defaults.set(encodedUser, forKey: userKey)
        }
        
        let insertResponse = try await client.database.from("users").insert(user).execute()
        return insertResponse.status == 201
    }
}
