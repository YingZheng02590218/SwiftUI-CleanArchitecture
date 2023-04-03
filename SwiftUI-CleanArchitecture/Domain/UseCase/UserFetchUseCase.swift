//
//  UserFetchUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/12.
//

import Foundation

protocol UserFetchUseCaseInput {
    func fetchUser() async throws -> Void
    func getIsUserDataSaved()
}

protocol UserFetchUseCaseOutput {
    func outputUserData(outputData: UserFetchOutputData)
    func failFetchUser()
    func outputIsUserDataSaved(isSaved: Bool)
}

final class UserFetchUseCase: UserFetchUseCaseInput {
    private let userRepository: UserRepositoryInterface
    private let output: UserFetchUseCaseOutput
    
    init(userRepository: UserRepositoryInterface, output: UserFetchUseCaseOutput) {
        self.userRepository = userRepository
        self.output = output
    }
    
    func fetchUser() async throws -> Void {
        do {
            let entity = try await userRepository.fetchUser()
            let outputData = UserFetchOutputDataTranslator.shared.translate(entity: entity)
            output.outputUserData(outputData: outputData)
            return
        } catch {
            output.failFetchUser()
        }
    }
    
    func getIsUserDataSaved() {
        let isSaved = userRepository.getIsUserDataSaved()
        output.outputIsUserDataSaved(isSaved: isSaved)
    }
}
