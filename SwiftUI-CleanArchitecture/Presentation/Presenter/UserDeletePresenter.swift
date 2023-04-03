//
//  UserDeletePresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/17.
//

import Foundation

final class UserDeletePresenter: UserDeleteUseCaseOutput {
    var userProfileVM: UserProfileViewModel
    
    init(userProfileVM: UserProfileViewModel) {
        self.userProfileVM = userProfileVM
    }
    
    func successDeleteUser() {
        userProfileVM.isUserDataSaved = false
        userProfileVM.isShowSuccessDeleteUserAlert = true
    }
    
    func failDeleteUser() {
        userProfileVM.isShowFailDeleteUser = true
    }
}
