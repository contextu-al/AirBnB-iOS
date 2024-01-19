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
    var circle_diameter: Int
    var dismissbuttonTapped: () -> ()
        
    var body: some View {
        let width = CGFloat(circle_diameter)
        let height = CGFloat(circle_diameter)
        ZStack {
            Button(action: {self.dismissbuttonTapped()}){
                Image(systemName: "xmark.circle.fill")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 8)
                    .zIndex(11)
            }
            .offset(x: width/2, y: -1*(height/2))
            .zIndex(10)
            WebView(url: URL(string: vid_url)!)
                .cornerRadius(width/2)
                //.cornerRadius(10)
                .frame(width:width, height: height)
        }
        .frame(width: 100+width, height: 100+height) // Adjust popup size as you need
        .cornerRadius(width/2) // to get circle these will be smaller once dismiss is visible
        .shadow(radius: width/2)
        
    }
}


struct CircleVideoView_Previews: PreviewProvider {
    static var previews: some View {
        CircleVideoView(vid_url: "https://www.youtube.com/embed/dQw4w9WgXcQ?si=Wx9SC9sBIU6AlMnz",
                        circle_diameter: 150,
                        dismissbuttonTapped: {
        })
    }
}


