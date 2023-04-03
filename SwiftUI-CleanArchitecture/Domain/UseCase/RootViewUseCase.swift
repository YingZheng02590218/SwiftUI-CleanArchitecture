//
//  RootViewUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/29.
//

import Foundation

protocol RootViewUseCaseInput {
    func successSignUp()
    func successSignIn()
    func successSignOut()
    func alreadySignedUpUser()
    func notSignedUpUser()
}

protocol RootViewUseCaseOutput {
    func changeProfileView()
    func changeSignInView()
    func alreadySignedUpUser()
    func notSignedUpUser()
}

final class RootViewUseCase: RootViewUseCaseInput {
    private let output: RootViewUseCaseOutput
    
    init(output: RootViewUseCaseOutput) {
        self.output = output
    }
    
    func successSignUp() {
        output.changeProfileView()
    }
    
    func successSignIn() {
        output.changeProfileView()
    }
    // サインアウト
    func successSignOut() {
        output.changeSignInView()
    }
    
    func alreadySignedUpUser() {
        output.alreadySignedUpUser()
    }
    
    func notSignedUpUser() {
        output.notSignedUpUser()
    }
}
