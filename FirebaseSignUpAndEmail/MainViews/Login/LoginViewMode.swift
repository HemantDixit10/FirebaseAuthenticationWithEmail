//
//  LoginViewMode.swift
//  FirebaseSignUpAndEmail
//
//  Created by Tristate on 25.08.23.
//

import Foundation
import Firebase

class LoginViewMode: ObservableObject {
    // MARK: - Published Variables Defined
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showAlert = false
    @Published var alrtMsg: String = ""
    @Published var isLoading = false
    @Published var isSuccess: Bool = false
    func login() {
        isLoading = true
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { dataresult, error in
            self.isLoading = false
            guard dataresult != nil, error == nil else {
                DispatchQueue.main.async {
                    self.alrtMsg = error?.localizedDescription ?? ""
                    self.showAlert = false
                    self.isSuccess = true
                }
                return
            }
            DispatchQueue.main.async {
                self.alrtMsg = "Successfully login with Firebase."
                self.showAlert = true
                self.isSuccess = true
                self.email = ""
                self.password = ""
            }
        }
    }
    func checkValidation() {
        if email.isEmpty && password.isEmpty {
            alrtMsg = "Please Enter Email & Password"
            showAlert = false
            isSuccess = true
        } else if email.isEmpty {
            alrtMsg = "Please enter email Id."
            showAlert = false
            isSuccess = true
        } else if !email.isValidEmail(email: email) {
            alrtMsg = "Please enter valid email Id."
            showAlert = false
            isSuccess = true
        } else if password.isEmpty {
            alrtMsg = "Please enter password."
            showAlert = false
            isSuccess = true
        } else {
            login()
        }
    }
}
