//
//  UserRequestToFirestore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Firebase
import FirebaseAuth

final class UserRequestToFirestore {
    private let reference = Firestore.firestore().collection("users")
    private var uid: String {
        Auth.auth().currentUser?.uid ?? ""
    }
    
    func saveUser(inputEntity: UserAddInputEntity) async throws -> Void {
        return try await withCheckedThrowingContinuation { continuation in
            reference.document(uid).collection("user").addDocument(data: [
                "uid" : uid,
                "name" : inputEntity.name,
                "gender" : inputEntity.gender,
                "createdAt" : inputEntity.createdAt
            ]) { error in
                if let error = error {
                    print("Error writing document:", error)
                    continuation.resume(throwing: error)
                } else {
                    print("Success write document.")
                    continuation.resume(returning: ())
                }
            }
        }
    }
    
    func fetchUser() async throws -> UserFetchOutputEntity {
        return try await withCheckedThrowingContinuation({ continuation in
            reference.document(uid).collection("user").getDocuments { snapShot, error in
                if let error = error {
                    print("Error getting documents:", error)
                    continuation.resume(throwing: error)
                }
                
                if let snapshotDocuments = snapShot?.documents {
                    snapshotDocuments.forEach { document in
                        let data = document.data()
                        if let uid = data["uid"] as? String,
                           let name = data["name"] as? String,
                           let gender = data["gender"] as? Int,
                           let createdAt = data["createdAt"] as? Double,
                           let documentId = document.documentID as String? {
                            
                            let entity = UserFetchOutputEntity(
                                uid: uid,
                                name: name,
                                gender: gender,
                                createdAt: createdAt,
                                documentId: documentId
                            )
                            
                            continuation.resume(returning: entity)
                        } else {
                            let error = NSError(domain: "Required document data not found.", code: -1)
                            continuation.resume(throwing: error)
                        }
                    }
                }
            }
        })
    }
    
    
    func deleteUser() async throws -> Void {
        return try await withCheckedThrowingContinuation({ continuation in
            reference.document(uid).collection("user").getDocuments { snapShot, error in
                if let error = error {
                    print("Error getting documents:", error)
                    continuation.resume(throwing: error)
                }
                
                if let snapshotDocuments = snapShot?.documents {
                    snapshotDocuments.forEach { document in
                        document.reference.delete()
                    }
                    
                    print("Success remove document.")
                    continuation.resume(returning: ())
                }
            }
        })
    }
}
