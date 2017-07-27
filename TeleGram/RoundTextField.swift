//
//  RoundTextField.swift
//  TeleGram
//
//  Created by Konstantine Piterman on 7/26/17.
//  Copyright © 2017 Konstantine Piterman. All rights reserved.
//

import UIKit

@IBDesignable
class RoundTextField: UITextField {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        //default value is 0
        
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            
            //if corner is rounded at all, turn on bordering
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
    
    
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            //ternary operation acting upon existing, adds existing placeholder empty text, reassigns color to text field
          
        
            let str = NSAttributedString(string: rawString, attributes: [NSAttributedStringKey.foregroundColor: placeholderColor!])
            attributedPlaceholder = str
        }
    

    }
}
