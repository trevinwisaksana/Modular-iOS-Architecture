//
//  Title.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import Foundation

enum Title: String, CustomStringConvertible {
    
    case login = "Login"
    
    var description: String {
        return rawValue
    }
    
}
