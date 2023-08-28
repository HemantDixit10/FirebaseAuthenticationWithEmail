//
//  AlertCustom.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate on 04/08/23.
//

import SwiftUI

public struct AlertCustom: ViewModifier {
    @Binding var isShow: Bool
    @Binding var isSuccess: Bool
    @Binding var msg: String
    var callback: () -> Void
    @State var yPosition: CGFloat = -300
    public func body(content: Content) -> some View {
        content.overlay {
            if isShow {
                ZStack {
                    Color.black.opacity(0.8).ignoresSafeArea()
                    VStack {
                        Spacer()
                        withAnimation(.spring(response: 0.45, dampingFraction: 0.9)) {
                            VStack(spacing: 10) {
                                detailView
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .padding(.top, 20)
                            .padding(.horizontal, 16)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(style: StrokeStyle(lineWidth: 1))
                                    .foregroundColor(Color.orangeColor)
                            })
                            .padding(.horizontal, 50)
                            .overlay(alignment: .top) {
                                Image(systemName: isSuccess ? "checkmark" : "xmark")
                                    .renderingMode(.template)
                                    .frame(width: 60, height: 60)
                                    .background(Color.blueColor)
                                    .foregroundColor(Color.white)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(lineWidth: 4).foregroundColor(.white))
                                    .offset(y: -30)
                            }
                            .offset(y: yPosition)
                            .onAppear {
                                DispatchQueue.main.async {
                                    withAnimation(.linear(duration: 0.5)) {
                                        yPosition = 0
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
    @ViewBuilder var detailView: some View {
        Text("Firebase Demo")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Color.orangeColor)
        Text(msg)
            .font(.custom("Helvetica Neue", size: 14))
            .foregroundColor(Color.black)
        Button {
            callback()
            yPosition = -300
        } label: {
            Text("Okay")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color.white)
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(Color.orangeColor)
        .cornerRadius(8)
    }
}
