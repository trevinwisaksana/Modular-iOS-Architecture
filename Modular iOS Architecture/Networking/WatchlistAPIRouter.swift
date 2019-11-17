//
//  WatchlistAPIRouter.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 12/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import Alamofire

enum WatchlistAPIRouter: URLRequestConvertible {
       
    case getActiveSymbols
    case getCompanyProfile(companySymbol: String)
    
    var method: HTTPMethod {
        switch self {
        case .getActiveSymbols, .getCompanyProfile:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getActiveSymbols:
            return "stock/actives"
        case .getCompanyProfile(let companySymbol):
            return "company/profile/" + companySymbol
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        guard let url = BaseURL.api.url else {
            fatalError("Failed to get URL.")
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return try URLEncoding.default.encode(urlRequest, with: nil)
    }
    
}
