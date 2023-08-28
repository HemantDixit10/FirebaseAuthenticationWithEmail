//
//  Validation.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate on 02/08/23.
//

import Foundation

extension String {
    func isValidEmail(email: String) -> Bool {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

         let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
         return emailPred.evaluate(with: email)
     }
}
