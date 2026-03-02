//
//  Transfer Screen zu VR.swift
//  hjbhub
//
//  Created by Leonie Laskowitz on 02.03.26.
//

import SwiftUI

struct VRStartSplashView: View {
    var body: some View {
        ZStack {
            Color(red: 0.00, green: 0.79, blue: 0.31)
                .ignoresSafeArea()

            VStack {
                ZStack {
                    // Avatar-Kreis
                    Circle()
                        .fill(.white)
                        .frame(width: 128, height: 128)
                        .shadow(color: .black.opacity(0.25), radius: 25, y: 12)
                        .overlay(
                            Image("Icon") // z.B. Avatar/Icon aus Assets
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                        )
                        .offset(y: -74)

                    // Headline + Subheadline
                    VStack(spacing: 12) {
                        HStack(spacing: 8) {
                            Text("Viel Spaß in VR")
                                .font(.system(size: 36, weight: .bold))
                                .tracking(0.37)
                                .foregroundStyle(.white)

                            Image("Icon-1") // z.B. kleines Deko/Icon
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                        }

                        Text("Deine Session startet jetzt...")
                            .font(.system(size: 18))
                            .foregroundStyle(Color.white.opacity(0.9))
                    }
                    .offset(y: 54)

                    // Ladepunkte
                    HStack(spacing: 8) {
                        Circle().fill(.white).frame(width: 12, height: 12)
                        Circle().fill(.white).frame(width: 12, height: 12).offset(y: -2)
                        Circle().fill(.white).frame(width: 12, height: 12).offset(y: -3)
                    }
                    .offset(y: 132)
                }
                .frame(width: 292, height: 276)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 440, height: 956)
    }
}

#Preview {
    VRStartSplashView()
}
