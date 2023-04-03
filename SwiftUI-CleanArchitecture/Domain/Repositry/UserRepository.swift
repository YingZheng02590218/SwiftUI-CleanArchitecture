//
//  UserRepository.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

protocol UserRepositoryInterface {
    func saveUser(inputData: UserAddInputData) async throws -> Void
    func fetchUser() async throws -> UserFetchOutputEntity
    func deleteUser() async throws -> Void
    func getIsUserDataSaved() -> Bool
    func setIsUserDataSaved(isSaved: Bool)
}

final class UserRepository: UserRepositoryInterface {
    private let userDataStore: UserDataStoreInterface
    
    init(userDataStore: UserDataStoreInterface) {
        self.userDataStore = userDataStore
    }
    
    func saveUser(inputData: UserAddInputData) async throws -> Void {
        do {
            try await userDataStore.saveUser(inputData: inputData)
            return
        } catch {
            throw error
        }
    }
    
    func fetchUser() async throws -> UserFetchOutputEntity {
        do {
            let outputEntity = try await userDataStore.fetchUser()
            return outputEntity
        } catch {
            throw error
        }
    }
    
    func deleteUser() async throws -> Void {
        do {
            try await userDataStore.deleteUser()
            return
        } catch {
            throw error
        }
    }
    
    func getIsUserDataSaved() -> Bool {
        return userDataStore.getIsUserDataSaved()
    }
    
    func setIsUserDataSaved(isSaved: Bool) {
        userDataStore.setIsUserDataSaved(isSaved: isSaved)
    }
}
