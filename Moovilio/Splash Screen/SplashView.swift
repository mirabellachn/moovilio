//
//  SplashView.swift
//  Moovilio
//
//  Created by Mirabella on 19/01/26.
//

import SwiftUI

struct SplashView: View {

    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        if hasSeenOnboarding {
            MovieListView()
        } else {
            VStack(spacing: 24) {

                Spacer()

                VStack(spacing: 12) {
                    Text("Welcome to Moovilio")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

                    Text("Discover movies, watch trailers, and read reviews.")
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }

                Spacer()

                Button {
                    withAnimation(.easeInOut) {
                        hasSeenOnboarding = true
                    }
                } label: {
                    Text("Get Started")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.bottom, 32)
            }
            .padding()
        }
    }
}


