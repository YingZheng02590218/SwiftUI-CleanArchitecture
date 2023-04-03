//
//  AuthController.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

final class AuthController {
    private let authSignUpUseCase: AuthSignUpUseCaseInput
    private let authSignInUseCase: AuthSignInUseCaseInput
    private let authSignOutuseCase: AuthSignOutUseCaseInput
    private let authUserFetchUseCase: AuthUserFetchUseCaseInput
    
    init(
        authSignUpUseCase: AuthSignUpUseCaseInput,
        authSignInUseCase: AuthSignInUseCaseInput,
        authSignOutUseCase: AuthSignOutUseCaseInput,
        authUserFetchUseCase: AuthUserFetchUseCaseInput
    ) {
        self.authSignUpUseCase = authSignUpUseCase
        self.authSignInUseCase = authSignInUseCase
        self.authSignOutuseCase = authSignOutUseCase
        self.authUserFetchUseCase = authUserFetchUseCase
    }
    
    func signUp(email: String, password: String) {
        let model = AuthRequestModel(email: email, password: password)
        Task {
            await authSignUpUseCase.signUp(requestModel: model)
        }
    }
    
    func signIn(email: String, password: String) {
        let model = AuthRequestModel(email: email, password: password)
        Task {
            await authSignInUseCase.signIn(requestModel: model)
        }
    }
    
    func signOut() {
        Task {
            try await authSignOutuseCase.signOut()
        }
    }
    // フェッチ
    func fetchAuthCurrentUser() {
        Task {
            await authUserFetchUseCase.fetchAuthCurrentUser()
        }
    }
}
