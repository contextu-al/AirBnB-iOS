//
//  CircleVideoView.swift
//  airbnb-main
//
//  Created by David Jones on 11/12/2023.
//

import SwiftUI
import WebKit


// WebView Representable
struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
}


// Round Popup View
struct CircleVideoView: View {
    var vid_url: String
    var dismissbuttonTapped: () -> ()
        
    var body: some View {

        VStack {
            Button("<X>", action: {
                self.dismissbuttonTapped()
            })
            WebView(url: URL(string: vid_url)!)
                .cornerRadius(70)
                .frame(height: 150) // Adjust size as needed
            
        }
        .frame(width: 150, height: 150) // Adjust popup size
        .background(Color.white)
        .cornerRadius(70)
        .shadow(radius: 70)
        
    }
}





