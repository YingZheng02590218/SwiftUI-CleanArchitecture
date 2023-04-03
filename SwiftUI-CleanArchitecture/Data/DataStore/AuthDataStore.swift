//
//  AuthDataStore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/20.
//

import Foundation

protocol AuthDataStoreInterface {
    func signUp(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity
    func signIn(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity
    func signOut() async throws
    func fetchAuthCurrentUser() async -> AuthUserEntity?
}

final class AuthDataStore: AuthDataStoreInterface {
    private let authRequest = AuthRequestToFirebase()
    
    func signUp(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity {
        let request = AuthRequestEntity(email: requestModel.email, password: requestModel.password)
        let response = await authRequest.signUp(requestEntity: request)
        return response
    }
    
    func signIn(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity {
        let request = AuthRequestEntity(email: requestModel.email, password: requestModel.password)
        let response = await authRequest.signIn(requestEntity: request)
        return response
    }
    
    func signOut() async throws {
        do {
            try await authRequest.signout()
        } catch {
            throw(error)
        }
    }
    // フェッチ
    func fetchAuthCurrentUser() async -> AuthUserEntity? {
        let entity = await authRequest.fetchAuthCurrentUser()
        return entity
    }
}
