//
//  SignUpView.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate on 01/08/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    @Environment (\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: SignUpViewModel
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
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .modifier(ClearButton(text: $viewModel.email))
                        }
                        DividerView()
                        // PASSWORD
                        HStack {
                            Image("img_tstpassword_icon")
                            SecureField("Password", text: $viewModel.password)
                                .modifier(ClearButton(text: $viewModel.password))
                        }
                        DividerView()
                        // CONFIRM PASSWORD
                        HStack {
                            Image("img_tstpassword_icon")
                            SecureField("Confirm Password", text: $viewModel.confPassword)
                                .modifier(ClearButton(text: $viewModel.confPassword))
                        }
                        DividerView()
                        // SIGN UP BUTTON
                        CustomeButton(btnTitle: "SignUp", btnBgColor: Color.orangeColor, btnClickAction: {
                            viewModel.checkValidation()
                        }).padding(.top, 10)
                        // LOGIN BUTTON
                        CustomeButton(btnTitle: "Login", btnBgColor: Color.blueColor, btnClickAction: {
                            dismiss()
                        }).padding(.top, 15)
                    }
                    .accentColor(Color.orangeColor)
                    .font(.system(size: 15))
                    .padding(.horizontal, 20)
                }
                .padding(.vertical, 34)
                .padding(.horizontal, 20)
            }
            .safeAreaInset(edge: .top) {
                HStack(alignment: .center) {
                    Text("Sign Up")
                        .font(.custom("Helvetica Neue", size: 22).bold())
                        .foregroundColor(Color.whiteColor)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orangeColor)
            }
        }
        .navigationBarBackButtonHidden(true)
        .overlay {
            if viewModel.isLoading {
                ActiveLoader()
            }
        }
        .modifier(AlertCustom(isShow: $viewModel.isSuccess, isSuccess: $viewModel.alrtShow, msg: Binding.constant(viewModel.alrtMsg), callback: {
            viewModel.isSuccess = false
            if viewModel.validTrue {
                self.presentation.wrappedValue.dismiss()
                viewModel.validTrue = false
            }
        }, yPosition: -300)
        )
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}
