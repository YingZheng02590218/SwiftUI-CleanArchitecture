//
//  RootViewController.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/29.
//

import Foundation

final class RootViewController {
    private let rootViewUseCase: RootViewUseCaseInput
    
    init(rootViewUseCase: RootViewUseCaseInput) {
        self.rootViewUseCase = rootViewUseCase
    }
    
    func successSignUp() {
        rootViewUseCase.successSignUp()
    }
    
    func successSignIn() {
        rootViewUseCase.successSignIn()
    }
    
    func successSignOut() {
        rootViewUseCase.successSignOut()
    }
    
    func alreadySignedUpUser() {
        rootViewUseCase.alreadySignedUpUser()
    }
    
    func notSignedUpUser() {
        rootViewUseCase.notSignedUpUser()
    }
}
