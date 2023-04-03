//
//  AuthSignUpUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

protocol AuthSignUpUseCaseInput {
    func signUp(requestModel: AuthRequestModel) async
}

protocol AuthSignUpUseCaseOutput {
    func successSignUp()
    func failInvalidEmail()
    func failWeakPassword()
    func failEmailAlreadyInUse()
    func failNetworkError()
    func failOtherError()
}

final class AuthSignUpUseCase: AuthSignUpUseCaseInput {
    private let authRepository: AuthRepositoryInterface
    private let output: AuthSignUpUseCaseOutput
    
    init(authRepository: AuthRepositoryInterface, output: AuthSignUpUseCaseOutput) {
        self.authRepository = authRepository
        self.output = output
    }
    
    func signUp(requestModel: AuthRequestModel) async {
        let response = await authRepository.signUp(requestModel: requestModel)
        let responseType = AuthResponseTypeTranslator.shared.translate(responseTypeEntity: response)
        
        switch responseType {
        case .success:
            output.successSignUp()
        case .invalidEmail:
            output.failInvalidEmail()
        case .weakPassword:
            output.failWeakPassword()
        case .emailAlreadyInUse:
            output.failEmailAlreadyInUse()
        case .networkError:
            output.failNetworkError()
        case .otherError:
            output.failOtherError() // 存在しないメールアドレス
        }
    }
}
