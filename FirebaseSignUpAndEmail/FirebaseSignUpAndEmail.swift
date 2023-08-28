//
//  FirebaseSignUpAndEmail.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate on 01/08/23.
//

import SwiftUI
import Firebase

@main
struct FirebaseSignUpAndEmail: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewMode()).preferredColorScheme(.light)
        }
    }
}
