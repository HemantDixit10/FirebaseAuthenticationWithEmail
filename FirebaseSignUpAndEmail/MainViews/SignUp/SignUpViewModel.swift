//
//  SignUpViewModel.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate22 on 25.08.23.
//

import Foundation
import Firebase

class SignUpViewModel: ObservableObject {
    // MARK: - Published Variables Defined
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confPassword: String = ""
    @Published var alrtMsg: String = ""
    @Published var alrtShow: Bool = false
    @Published var isLoading = false
    @Published var validTrue: Bool = false
    @Published var isSuccess: Bool = false
    func register() {
        isLoading = true
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { dataresult, error in
            self.isLoading = false
            guard dataresult != nil, error == nil else {
                DispatchQueue.main.async {
                    self.alrtMsg = error?.localizedDescription ?? ""
                    self.alrtShow = false
                    self.validTrue = false
                    self.isSuccess = true
                }
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.alrtMsg = "Successfully signup with Firebase."
                self.alrtShow = true
                self.validTrue = true
                self.isSuccess = true
            }
        }
    }
    func checkValidation() {
        if email.isEmpty && password.isEmpty && confPassword.isEmpty {
            alrtMsg = "Please Enter Email, Password & confirmPassword"
            alrtShow = false
            isSuccess = true
        } else if email.isEmpty {
            alrtMsg = "Please enter email Id."
            alrtShow = false
            isSuccess = true
        } else if password.isEmpty {
            alrtMsg = "Please enter password"
            alrtShow = false
            isSuccess = true
        } else if confPassword.isEmpty {
            alrtMsg = "Please enter confirm password"
            alrtShow = false
            isSuccess = true
        } else if !email.isValidEmail(email: email) {
            alrtMsg = "Please enter valid email Id."
            alrtShow = false
            isSuccess = true
        } else if password != confPassword {
            alrtMsg = "Password and confirm password does not match"
            alrtShow = false
            isSuccess = true
        } else {
            register()
        }
    }
}
