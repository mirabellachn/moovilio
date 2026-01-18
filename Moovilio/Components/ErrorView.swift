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
        VStack(spacing: 12) {
            Text(message)
                .font(.headline)

            Button("Retry") {
                retryAction()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ErrorView(
        message: "Failed to load movies",
        retryAction: {}
    )
}

