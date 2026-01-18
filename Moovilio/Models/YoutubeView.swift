//
//  YoutubeView.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {

    let videoKey: String

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")!
        uiView.load(URLRequest(url: url))
    }
}
