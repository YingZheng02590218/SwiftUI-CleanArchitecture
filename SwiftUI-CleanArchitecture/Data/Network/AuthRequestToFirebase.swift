//
//  AuthRequestToFirebase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/20.
//

import FirebaseAuth

// Infra層　API　外部DB
final class AuthRequestToFirebase {

    // Apple プラットフォームで Firebase Authentication を使ってみる
    // https://firebase.google.com/docs/auth/ios/start?hl=ja&authuser=0
    
    func signUp(requestEntity: AuthRequestEntity) async -> AuthResponseTypeEntity {
        // Entity DataStoreで扱うことができるデータの静的なモデル。Entity自身を直接操作することはなく、valueobjectとして使う。EntityはPresentation層では使用されない。
        return await withCheckedContinuation { continuation in
            // 新しいユーザーを登録する
            // 新規ユーザーがメールアドレスとパスワードを使用してアプリに登録できるフォームを作成します。ユーザーがフォームに入力したら、ユーザーから提供されたメールアドレスとパスワードを検証し、それらを createUser メソッドに渡します。
            Auth.auth().createUser(withEmail: requestEntity.email, password: requestEntity.password) { authResult, error in
                if let error = error,
                    let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                    switch errorCode {
                    case .invalidEmail:
                        continuation.resume(returning: .invalidEmail)
                    case .weakPassword:
                        continuation.resume(returning: .weakPassword)
                    case .emailAlreadyInUse:
                        continuation.resume(returning: .emailAlreadyInUse)
                    case .networkError:
                        continuation.resume(returning: .networkError)
                    default:
                        continuation.resume(returning: .otherError) // 存在しないメールアドレス
                    }
                } else {
                    continuation.resume(returning: .success)
                }
            }
        }
    }
    
    
    func signIn(requestEntity: AuthRequestEntity) async -> AuthResponseTypeEntity {
        return await withCheckedContinuation { continuation in
            // 既存のユーザーをログインさせる
            // 既存のユーザーがメールアドレスとパスワードを使用してログインできるフォームを作成します。ユーザーがフォームに入力したら、signIn メソッドを呼び出します。
            Auth.auth().signIn(withEmail: requestEntity.email, password: requestEntity.password) { authResult, error in
                if let error = error,
                    let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                    switch errorCode {
                    case .invalidEmail:
                        continuation.resume(returning: .invalidEmail)
                    case .weakPassword:
                        continuation.resume(returning: .weakPassword)
                    case .emailAlreadyInUse:
                        continuation.resume(returning: .emailAlreadyInUse)
                    case .networkError:
                        continuation.resume(returning: .networkError)
                    default:
                        continuation.resume(returning: .otherError)
                    }
                } else {
                    continuation.resume(returning: .success)
                }
            }
        }
    }
    // サインアウト
    func signout() async throws {
        do {
            try Auth.auth().signOut()
        } catch  let signOutError as NSError {
            print("Fail sign out.")
            print("Error message:", signOutError.debugDescription)
            throw(signOutError)
        }
    }
    // フェッチ
    func fetchAuthCurrentUser() async -> AuthUserEntity? {
        let auth = Auth.auth()
        
        guard let currentUser = auth.currentUser else {
            return nil
        }
        
        let uid = currentUser.uid
        let displayName = currentUser.displayName ?? ""
        let email = currentUser.email ?? ""
        let entity = AuthUserEntity(uid: uid, displayName: displayName, email: email)
        
        return entity
    }
}
