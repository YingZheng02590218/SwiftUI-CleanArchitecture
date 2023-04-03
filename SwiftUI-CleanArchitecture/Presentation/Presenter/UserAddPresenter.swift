//
//  UserAddPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/05.
//

import Foundation

final class UserAddPresenter: UserAddUseCaseOutput {
    var userProfileVM: UserProfileViewModel
    
    init(userProfileVM: UserProfileViewModel) {
        self.userProfileVM = userProfileVM
    }
    
    func invalidUserName() {
        userProfileVM.isShowUserNameAlert = true
    }
    
    func invalidGender() {
        userProfileVM.isShowGenderAlert = true
    }
    
    func successSaveUser() {
        userProfileVM.isShowSuccessSaveUserAlert = true
    }
    
    func failSaveUser() {
        userProfileVM.isShowFailSaveUserAlert = true
    }
}
