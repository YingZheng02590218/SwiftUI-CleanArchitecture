//
//  AuthSignInUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/23.
//

import Foundation

protocol AuthSignInUseCaseInput {
    func signIn(requestModel: AuthRequestModel) async
}

protocol AuthSignUseCaseOutput {
    func successSignIn()
    func failInvalidEmail()
    func failWeakPassword()
    func failEmailAlreadyInUse()
    func failNetworkError()
    func failOtherError()
}

final class AuthSignInUseCase: AuthSignInUseCaseInput {
    private let authRepository: AuthRepositoryInterface
    private let output: AuthSignUseCaseOutput
    
    init(authRepository: AuthRepositoryInterface, output: AuthSignUseCaseOutput) {
        self.authRepository = authRepository
        self.output = output
    }
    
    func signIn(requestModel: AuthRequestModel) async {
        let response = await authRepository.signIn(requestModel: requestModel)
        let responceType = AuthResponseTypeTranslator.shared.translate(responseTypeEntity: response)
        
        switch responceType {
        case .success:
            output.successSignIn()
        case .invalidEmail:
            output.failInvalidEmail()
        case .weakPassword:
            output.failWeakPassword()
        case .emailAlreadyInUse:
            output.failEmailAlreadyInUse()
        case .networkError:
            output.failNetworkError()
        case .otherError:
            output.failOtherError()
        }
    }
}
