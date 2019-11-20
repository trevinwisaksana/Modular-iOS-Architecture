//
//  BaseURL.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 12/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import Foundation

public enum BaseURL {

    case api
    
    public var urlString: String {
        return "https://financialmodelingprep.com/api/v3/"
    }
    
    public var url: URL? {
        guard let formattedURLString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return nil
        }
        
        return URL(string: formattedURLString)
    }

}
