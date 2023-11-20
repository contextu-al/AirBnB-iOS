//
//  UIImageView.swift
//  airbnb-main
//
//  Created by Marc Stroebel on 13/11/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(from string: String?) {
        guard let urlString = string else {
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        self.loadImage(from: url)
    }
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                // Once the data is received, create a UIImage from it and update the UI on the main thread
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            } else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
