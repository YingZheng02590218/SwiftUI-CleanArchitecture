//
//  AuthUserFetchUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/08.
//

import Foundation

protocol AuthUserFetchUseCaseInput {
    func fetchAuthCurrentUser() async
}

protocol AuthUserFetchUseCaseOutput {
    func successFetchedUser(model: AuthUserModel)
    func failFetchedUser()
}

final class AuthUserFetchUseCase: AuthUserFetchUseCaseInput {
    private let authRepository: AuthRepositoryInterface
    private let output: AuthUserFetchUseCaseOutput
    
    init(authRepository: AuthRepositoryInterface, output: AuthUserFetchUseCaseOutput) {
        self.authRepository = authRepository
        self.output = output
    }
    // フェッチ
    func fetchAuthCurrentUser() async {
        let entity = await authRepository.fetchAuthCurrentUser()
        guard let entity = entity else {
            output.failFetchedUser()
            return
        }

        let model = AuthUserModelTranslator.shared.translate(entity: entity)
        output.successFetchedUser(model: model)
    }
}
