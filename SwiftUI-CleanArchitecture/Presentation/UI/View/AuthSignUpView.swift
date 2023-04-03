//
//  AuthSignUpView.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import SwiftUI

struct AuthSignUpView: View {
    @ObservedObject var authSignUpVM: AuthSignUpViewModel
    @State private var email = ""
    @State private var password = ""
    let authController: AuthController
    let rootViewController: RootViewController
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("新規ユーザー登録")
                    .font(.system(size: 28, weight: .semibold, design: .default))
                VStack {
                    VStack(spacing: 0) {
                        Text("必須")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(width: geometry.size.width / 1.3, alignment: .leading)
                        TextField("メールアドレス（6文字以上）", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical, 5)
                            .padding(.horizontal, 35)
                            .keyboardType(.default)
                    }
                    VStack(spacing: 0) {
                        Text("必須")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(width: geometry.size.width / 1.3, alignment: .leading)
                        TextField("パスワード", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical, 5)
                            .padding(.horizontal, 35)
                            .keyboardType(.default)
                    }
                }
                .padding(.top, 20)
                ButtonView(text: "サインアップ", textColor: .white, color: .black, buttonEnabled: true) {
                    onTapSignUpButton(email: email, password: password)
                }
                .padding(.top, 20)
                .alert("登録完了", isPresented: $authSignUpVM.isShowSuccessSignUpAlert) {
                    Button("OK") {
                        rootViewController.successSignUp()
                    }
                } message: {
                    Text("サインアップに成功しました！")
                }
                .alert("登録失敗", isPresented: $authSignUpVM.isShowFailInvalidEmailAlert) {
                    Button("やり直す") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("メールアドレスの形式が間違っています")
                }
                .alert("登録失敗", isPresented: $authSignUpVM.isShowFailWeakPasswordAlert) {
                    Button("やり直す") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("パスワードは6文字以上で入力して下さい")
                }
                .alert("登録失敗", isPresented: $authSignUpVM.isShowFailEmailAlreadyInUseAlert) {
                    Button("やり直す") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("このメールアドレスは既に登録されています")
                }
                .alert("登録失敗", isPresented: $authSignUpVM.isShowFailNetworkErrorAlert) {
                    Button("OK") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("登録に失敗しました。通信状態が良好な環境で再度お試しください")
                }
                .alert("登録失敗", isPresented: $authSignUpVM.isShowFailOtherErrorAlert) {
                    Button("OK") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("入力内容が正しくありません")
                }
                ButtonView(text: "既に登録済みの方はこちら", textColor: .blue, buttonEnabled: true) {
                    rootViewController.alreadySignedUpUser()
                }
                .padding(.top, 2)
                Spacer()
            }
        }
    }
}

extension AuthSignUpView {
    private func resetEmailAndPassword() {
        email = ""
        password = ""
    }
    
    private func onTapSignUpButton(email: String, password: String) {
        authController.signUp(email: email, password: password)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AuthSignUpBuilder.shared.build()
    }
}
