//
//  UserProfileViewModel.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/05.
//

import Foundation

final class UserProfileViewModel: ObservableObject {
    @Published var isShowUserNameAlert = false
    @Published var isShowGenderAlert = false
    @Published var isShowSuccessSaveUserAlert = false
    @Published var isShowFailSaveUserAlert = false
    @Published var isShowNextPage = false
    @Published var isShowFailFetchUserAlert = false
    @Published var isUserDataSaved = false
    @Published var userFetchOutputData = UserFetchOutputData(uid: "", name: "", gender: "", createdDay: "", documentId: "")
    @Published var isShowSuccessDeleteUserAlert = false
    @Published var isShowFailDeleteUser = false
}
