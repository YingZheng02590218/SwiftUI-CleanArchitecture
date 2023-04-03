//
//  UserDeleteUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/17.
//

import Foundation

protocol UserDeleteUseCaseInput {
    func deleteUser() async throws
}

protocol UserDeleteUseCaseOutput {
    func successDeleteUser()
    func failDeleteUser()
}

final class UserDeleteUseCase: UserDeleteUseCaseInput {
    private let userRepository: UserRepositoryInterface
    private let output: UserDeleteUseCaseOutput
    
    init(userRepository: UserRepositoryInterface, output: UserDeleteUseCaseOutput) {
        self.userRepository = userRepository
        self.output = output
    }
    
    func deleteUser() async throws {
        do {
            try await userRepository.deleteUser()
            userRepository.setIsUserDataSaved(isSaved: false)
            output.successDeleteUser()
        } catch {
            output.failDeleteUser()
        }
    }
}
