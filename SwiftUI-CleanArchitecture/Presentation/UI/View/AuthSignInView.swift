//
//  AuthSignInView.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/23.
//

import SwiftUI

struct AuthSignInView: View {
    @ObservedObject var authSignInVM: AuthSignInViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var signInButtonEnabled = false
    let authController: AuthController
    let rootViewController: RootViewController
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("サインイン")
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
                ButtonView(text: "サインイン", textColor: .white, color: .green, buttonEnabled: true) {
                    onTapSignInButton(email: email, password: password)
                }
                .padding(.top, 20)
                .alert("登録完了", isPresented: $authSignInVM.isShowSuccessSignInAlert) {
                    Button("OK") {
                        rootViewController.successSignIn()
                    }
                } message: {
                    Text("サインアップに成功しました！")
                }
                .alert("登録失敗", isPresented: $authSignInVM.isShowFailInvalidEmailAlert) {
                    Button("やり直す") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("メールアドレスの形式が間違っています")
                }
                .alert("登録失敗", isPresented: $authSignInVM.isShowFailWeakPasswordAlert) {
                    Button("やり直す") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("パスワードは6文字以上で入力して下さい")
                }
                .alert("登録失敗", isPresented: $authSignInVM.isShowFailEmailAlreadyInUseAlert) {
                    Button("やり直す") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("このメールアドレスは既に登録されています")
                }
                .alert("登録失敗", isPresented: $authSignInVM.isShowFailNetworkErrorAlert) {
                    Button("OK") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("登録に失敗しました。通信状態が良好な環境で再度お試しください")
                }
                .alert("登録失敗", isPresented: $authSignInVM.isShowFailOtherErrorAlert) {
                    Button("OK") {
                        resetEmailAndPassword()
                    }
                } message: {
                    Text("入力内容が正しくありません")
                }
                ButtonView(text: "まだ登録していない方はこちら", textColor: .blue, buttonEnabled: true) {
                    rootViewController.notSignedUpUser()
                }
                .padding(.top, 2)
                Spacer()
            }
        }
    }
}

extension AuthSignInView {
    private func resetEmailAndPassword() {
        email = ""
        password = ""
    }
    
    private func onTapSignInButton(email: String, password: String) {
        authController.signIn(email: email, password: password)
    }
}

struct AuthSignInView_Previews: PreviewProvider {
    static var previews: some View {
        AuthSignInBuilder.shared.build()
    }
}
