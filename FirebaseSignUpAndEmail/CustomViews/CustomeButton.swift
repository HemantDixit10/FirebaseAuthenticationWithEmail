//
//  CustomeButton.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate on 04/08/23.
//

import SwiftUI

struct CustomeButton: View {
    @State var btnTitle: String = ""
    @State var btnBgColor: Color = Color.orangeColor
    var btnClickAction: () -> Void
    var body: some View {
        Button {
            btnClickAction()
        } label: {
            ButtonTitleView(btnTitle: btnTitle, btnBgColor: btnBgColor)
        }
    }
}

struct ButtonTitleView: View {
    @State var btnTitle: String = ""
    @State var btnBgColor: Color = Color.orangeColor
    var body: some View {
        Text(btnTitle)
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .font(.custom("Helvetica Neue", size: 18).bold())
            .foregroundColor(Color.whiteColor)
            .background(btnBgColor)
            .cornerRadius(5)
    }
}
