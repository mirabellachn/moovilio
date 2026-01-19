//
//  ErrorView.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import SwiftUI

struct ErrorView: View {

    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {

            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundStyle(.secondary)

            Text(message)
                .font(.headline)
                .multilineTextAlignment(.center)

            Button {
                retryAction()
            } label: {
                Text("Try Again")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(.thinMaterial)
                    .clipShape(Capsule())
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#Preview {
    ErrorView(
        message: "Failed to load movies",
        retryAction: {}
    )
}

