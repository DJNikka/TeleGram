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

        

}