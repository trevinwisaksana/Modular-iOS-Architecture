//
//  UITextFieldExtensions.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 09/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setLeftPadding(amount: CGFloat = 20.0) {
        let paddingFrame = CGRect(x: 0, y: 0, width: amount, height: frame.size.height)
        let paddingView = UIView(frame: paddingFrame)
        
        leftView = paddingView
        leftViewMode = .always
    }
    
    func setRightPadding(amount: CGFloat = 20.0) {
        let paddingFrame = CGRect(x: 0, y: 0, width: amount, height: frame.size.height)
        let paddingView = UIView(frame: paddingFrame)
        
        rightView = paddingView
        rightViewMode = .always
    }
    
}
