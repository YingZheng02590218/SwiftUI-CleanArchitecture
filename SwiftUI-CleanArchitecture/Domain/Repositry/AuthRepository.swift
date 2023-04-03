//
//  AuthRepository.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

// Domain層　UseCase　Repository(Protocol)　Entity
protocol AuthRepositoryInterface {
    func signUp(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity
    func signIn(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity
    func signOut() async throws
    func fetchAuthCurrentUser() async -> AuthUserEntity?
}

final class AuthRepository: AuthRepositoryInterface {
    private let authDataStore: AuthDataStoreInterface
    
    init(authDataStore: AuthDataStoreInterface) {
        self.authDataStore = authDataStore
    }
    
    func signUp(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity {
        // DataStore 実際のデータの保存や取得する処理を記述する。FirebaseやAPIへのリクエストを投げたりする。
        let response = await authDataStore.signUp(requestModel: requestModel)
        return response
    }
    
    func signIn(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity {
        let response = await authDataStore.signIn(requestModel: requestModel)
        return response
    }
    // サインアウト
    func signOut() async throws {
        do {
            try await authDataStore.signOut()
        } catch {
            throw(error)
        }
    }
    // フェッチ
    func fetchAuthCurrentUser() async -> AuthUserEntity? {
        let entity = await authDataStore.fetchAuthCurrentUser()
        return entity
    }
}
