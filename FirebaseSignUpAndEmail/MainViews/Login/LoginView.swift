//
//  LoginView.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate on 01/08/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewMode
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    Image("logo")
                        .resizable()
                        .frame(width: 256, height: 200, alignment: .center)
                        .scaledToFit()
                    VStack(spacing: 10) {
                        // EMAIL
                        HStack {
                            Image("img_email_icon")
                            TextField("Email", text: $viewModel.email)
                                .modifier(ClearButton(text: $viewModel.email))
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        DividerView()
                        // PASSWORD
                        HStack {
                            Image("img_tstpassword_icon")
                            SecureField("Password", text: $viewModel.password)
                                .modifier(ClearButton(text: $viewModel.password))
                        }
                        DividerView()
                        // LOGIN BUTTON
                        CustomeButton(btnTitle: "Login", btnBgColor: Color.orangeColor, btnClickAction: {
                            viewModel.checkValidation()
                        }).padding(.top, 10)
                        // SIGN UP BUTTON
                        NavigationLink {
                            SignUpView(viewModel: SignUpViewModel())
                        } label: {
                            ButtonTitleView(btnTitle: "Sign Up", btnBgColor: .blueColor)
                        }
                        .padding(.top, 15)
                    }
                    .accentColor(Color.orangeColor)
                    .font(.system(size: 15))
                    .padding(.horizontal, 20)
                }
                .padding(.vertical, 34)
                .padding(.horizontal, 20)
            }
            .onAppear {
                self.viewModel.email = ""
                self.viewModel.password = ""
            }
            .safeAreaInset(edge: .top) {
                HStack(alignment: .center) {
                    Text("Login")
                        .font(.custom("Helvetica Neue", size: 22).bold())
                        .foregroundColor(Color.whiteColor)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orangeColor)
            }
        }
        .overlay {
            if viewModel.isLoading {
                ActiveLoader()
            }
        }
        .modifier( AlertCustom(isShow: $viewModel.isSuccess, isSuccess: $viewModel.showAlert, msg: Binding.constant(viewModel.alrtMsg), callback: {
            viewModel.isSuccess = false
        }, yPosition: -300)
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewMode())
    }
}
