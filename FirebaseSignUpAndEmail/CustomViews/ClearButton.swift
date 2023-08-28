//
//  ClearButton.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate on 02/08/23.
//

import SwiftUI

struct ClearButton: ViewModifier {
    @Binding var text: String
    func body(content: Content) -> some View {
        HStack {
            content.overlay(alignment: .trailing) {
                if !text.isEmpty {
                    Button {
                        self.text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("lineColor"))
                    }
                    .frame(width: 10, height: 10)
                }
            }
        }
    }
}
