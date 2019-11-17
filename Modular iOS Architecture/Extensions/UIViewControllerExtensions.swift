//
//  UIViewControllerExtensions.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

protocol UINibLoadable { }

extension UINibLoadable where Self: UIViewController {

    static func loadFromNib() -> Self? {
        let nibName = String(describing: self)
        let bundle = Bundle(for: Self.self)
        
        return Self(nibName: nibName, bundle: bundle)
    }
    
}
