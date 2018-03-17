//
//  NSMutableAttributedStringExtension.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import UIKit
extension NSMutableAttributedString{
    static func setTitleAndDescription(wit title:String,description:String)->NSMutableAttributedString?{
        let textString = "\n\(title)\n\n\(description)"
        let attrText = NSMutableAttributedString(string: textString)
        guard let largeFont = UIFont(name: "Arial-BoldMT", size: 15.0) else {return nil}
        guard let smallFont = UIFont(name: "Arial", size: 12.0) else {return nil}
        let largeTextRange = (textString as NSString).range(of: title)
        let smallTextRange = (textString as NSString).range(of: description)
        attrText.addAttribute(NSAttributedStringKey.font, value: largeFont, range: largeTextRange)
        attrText.addAttribute(NSAttributedStringKey.font, value: smallFont, range: smallTextRange)
        return attrText
    }
}
