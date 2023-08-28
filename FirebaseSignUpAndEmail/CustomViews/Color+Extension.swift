//
//  Color+Extension.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate on 04/08/23.
//

import Foundation
import SwiftUI

extension Color {
    static let orangeColor = Color.init(hex: 0xE96C1A)
    static let blueColor = Color.init(hex: 0x0E1E4E)
    static let grayColor = Color.init(hex: 0xCCCCCC)
    static let whiteColor = Color.init(hex: 0xFFFFFF)
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
