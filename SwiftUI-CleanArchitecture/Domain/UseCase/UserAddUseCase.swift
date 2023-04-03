//
//  UserAddUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

protocol UserAddUseCaseInput {
    func saveUser(inputData: UserAddInputData) async throws -> Void
}

protocol UserAddUseCaseOutput {
    func invalidUserName()
    func invalidGender()
    func successSaveUser()
    func failSaveUser()
}

final class UserAddUseCase: UserAddUseCaseInput {
    private let userRepository: UserRepositoryInterface
    private let output: UserAddUseCaseOutput
    
    init(userRepository: UserRepositoryInterface, output: UserAddUseCaseOutput) {
        self.userRepository = userRepository
        self.output = output
    }
    
    func saveUser(inputData: UserAddInputData) async throws -> Void {
        do {
            let isValidUserName = isValidUserName(name: inputData.name)
            let isValidGender = isValidGender(gender: inputData.gender)
            
            if !isValidUserName {
                output.invalidUserName()
                return
            }
            
            if !isValidGender {
                output.invalidGender()
                return
            }
            
            try await userRepository.saveUser(inputData: inputData)
            userRepository.setIsUserDataSaved(isSaved: true)
            output.successSaveUser()
        } catch {
            output.failSaveUser()
        }
    }
    
    func isValidUserName(name: String) -> Bool {
        let isMin = name.count >= 2
        let isMax = name.count <= 10
        
        if isMin && isMax {
            return true
        } else {
            return false
        }
    }
    
    func isValidGender(gender: Int) -> Bool {
        switch gender {
        case 1:
            return true
        case 2:
            return true
        case 3:
            return true
        default:
            return false
        }
    }
}
