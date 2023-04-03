//
//  UserFetchPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/12.
//

import Foundation

final class UserFetchPresenter: UserFetchUseCaseOutput {
    var userProfileVM: UserProfileViewModel
    
    init(userProfileVM: UserProfileViewModel) {
        self.userProfileVM = userProfileVM
    }
    
    func outputUserData(outputData: UserFetchOutputData) {
        userProfileVM.isShowNextPage = true
        userProfileVM.userFetchOutputData = outputData
    }
    
    func failFetchUser() {
        userProfileVM.isShowFailSaveUserAlert = true
    }
    
    func outputIsUserDataSaved(isSaved: Bool) {
        userProfileVM.isUserDataSaved = isSaved
    }
}
