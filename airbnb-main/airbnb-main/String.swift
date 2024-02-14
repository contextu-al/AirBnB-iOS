//
//  String.swift
//  airbnb-main
//
//  Created by Yonas Stephen on 2017/3/13.
//  Copyright © 2017 Contextual.
//

import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = (self as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return boundingBox.height
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = (self as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return boundingBox.width
    }
    
    func lastTwoTokens(delimiter: Character = "/") -> (String?, String?) {
        let tokens = self.split(separator: delimiter)
        guard tokens.count >= 2 else { return (nil, nil) }
        
        let secondLastToken = String(tokens[tokens.count - 2])
        let lastToken = String(tokens.last!)
        
        return (secondLastToken, lastToken)
    }
}
