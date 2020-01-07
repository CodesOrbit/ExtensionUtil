//
//  UILabel.swift
//  ExtensionUtil
//
//  Created by Zia on 14/12/2019.
//  Copyright © 2019 CodesOrbit. All rights reserved.
//

import UIKit

public extension UILabel {
    
    /**
    Maximum no of lines required for the text assigned to **UILabel** to make it fully visible to user
    */
    
    var maxNumberOfLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let text = (self.text ?? "") as NSString
        let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font!], context: nil).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
    
    /**
     Add trailing text to **UILabel**
     
     - Parameters:
         - ellipseText: Text to be used for replacing the ellipse (...) (*optional default is set to empty string*)
         - trailingText: Text to be appended after **trailingText** (
         - trailingTextFont: Font to be used for trailing text (*optional default is set to system font of size 17*)
         - trailingTextColor: Color to be used for trailing text (*optional* default is set to black)
     
     One Use case for trailing text can be showing "see more" at the end of a UILabel
    */
    
    func addTrailing(ellipseText: String = "", trailingText: String, trailingTextFont: UIFont = UIFont.systemFont(ofSize: 17), trailingTextColor: UIColor = UIColor.black) {
        let readMoreText: String = ellipseText + trailingText
        let lengthForVisibleString: Int = self.visibleTextLength
        let mutableString: String = self.text!
        let trimmedString: String? = (mutableString as NSString).replacingCharacters(in: NSRange(location: lengthForVisibleString, length: ((self.text?.count)! - lengthForVisibleString)), with: "")
        let readMoreLength: Int = (readMoreText.count)
        let trimmedForReadMore: String = (trimmedString! as NSString).replacingCharacters(in: NSRange(location: ((trimmedString?.count ?? 0) - readMoreLength), length: readMoreLength), with: "") + ellipseText
        let answerAttributed = NSMutableAttributedString(string: trimmedForReadMore, attributes: [NSAttributedString.Key.font: self.font ?? UIFont.systemFont(ofSize: 17)])
        let readMoreAttributed = NSMutableAttributedString(string: trailingText, attributes: [NSAttributedString.Key.font: trailingTextFont, NSAttributedString.Key.foregroundColor: trailingTextColor])
        answerAttributed.append(readMoreAttributed)
        self.attributedText = answerAttributed
    }
    
    /**
     Lenght of text visible to user i.e. no of characters visible before the start of ellipses (...)
     */
    
     var visibleTextLength: Int {
        let font: UIFont = self.font
        let mode: NSLineBreakMode = self.lineBreakMode
        let labelWidth: CGFloat = self.frame.size.width
        let labelHeight: CGFloat = self.frame.size.height
        let sizeConstraint = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude)
        let attributes: [AnyHashable: Any] = [NSAttributedString.Key.font: font]
        let attributedText = NSAttributedString(string: self.text!, attributes: attributes as? [NSAttributedString.Key : Any])
        let boundingRect: CGRect = attributedText.boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, context: nil)
        
        if boundingRect.size.height > labelHeight {
            var index: Int = 0
            var prev: Int = 0
            let characterSet = CharacterSet.whitespacesAndNewlines
            repeat {
                prev = index
                if mode == NSLineBreakMode.byCharWrapping {
                    index += 1
                } else {
                    index = (self.text! as NSString).rangeOfCharacter(from: characterSet, options: [], range: NSRange(location: index + 1, length: self.text!.count - index - 1)).location
                }
            } while index != NSNotFound && index < self.text!.count && (self.text! as NSString).substring(to: index).boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, attributes: attributes as? [NSAttributedString.Key : Any], context: nil).size.height <= labelHeight
            return prev
        }
        return self.text!.count
    }
}
