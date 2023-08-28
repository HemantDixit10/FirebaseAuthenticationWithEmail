//
//  ActiveLoader.swift
//  FirebaseSignUpAndEmail
//
//  Created by tristate on 03/08/23.
//

import SwiftUI

struct ActiveLoader: View {
    @State var isLoading1: Bool = false
    let angular = AngularGradient(colors: [Color.blueColor], center: .center)
    var body: some View {
        ZStack {
            Color.black.opacity(0.8).ignoresSafeArea()
            ZStack(alignment: .center) {
                VStack {
                    ZStack {
                        Circle()
                            .trim(from: 0, to: 0.37)
                            .stroke(angular, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                            .frame(width: 100, height: 100, alignment: .center)
                            .rotationEffect(.init(degrees: isLoading1 ? 360 : 0))
                        Image("img_loading_ts_logo")
                            .foregroundColor(Color.blue)
                            .onAppear {
                                withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                                    isLoading1.toggle()
                                }
                            }
                    }
                    Text("Loading....")
                        .foregroundColor(Color.white)
                }
            }
        }
    }
}

struct ActiveLoader_Previews: PreviewProvider {
    static var previews: some View {
        ActiveLoader()
    }
}
