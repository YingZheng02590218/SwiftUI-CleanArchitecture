//
//  AuthSignOutUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/06.
//

import Foundation

protocol AuthSignOutUseCaseInput {
    func signOut() async throws
}

protocol AuthSignOutUseCaseOutput {
    func successSignOut()
    func failSignOut()
}

final class AuthSignOutUseCase: AuthSignOutUseCaseInput {
    private let authRepository: AuthRepositoryInterface
    private let output: AuthSignOutUseCaseOutput
    
    init(authRepository: AuthRepositoryInterface, output: AuthSignOutUseCaseOutput) {
        self.authRepository = authRepository
        self.output = output
    }
    // サインアウト
    func signOut() async throws {
        do {
            try await authRepository.signOut()
            output.successSignOut()
        } catch {
            output.failSignOut()
        }
    }
}
