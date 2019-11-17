//
//  CompanyPageViewModel.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 09/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import Foundation

enum CompanyProfileSection: Int, CaseIterable {
    case companyName
    case description
    case industry
    case chiefExecutiveOfficer
    case website
    
    var title: String {
        switch self {
        case .companyName:
            return "Name"
            
        case .description:
            return "Description"
            
        case .industry:
            return "Industry"
            
        case .chiefExecutiveOfficer:
            return "Chief Executive Officer"
            
        case .website:
            return "Website"
            
        }
    }
    
    var number: Int {
        return rawValue
    }
}

final class CompanyProfileViewModel: CompanyProfileViewInterface {
    
    private let watchlistAPIService = WatchlistAPIService()
    
    var companySymbol: String?
    var companyName: String?
    var companyProfileData: CompanyProfileModel?
    
    init(companySymbol: String?, companyName: String?) {
        self.companySymbol = companySymbol
        self.companyName = companyName
    }
    
    func getCompanyProfile(success: @escaping voidCompletionHandler, failure: @escaping errorMessageCompletionHandler) {
        
        guard let companySymbol = companySymbol else {
            return
        }
        
        watchlistAPIService.getCompanyProfile(withCompanySymbol: companySymbol, success: { (data) in
            
            self.companyProfileData = CompanyProfileModel(data: data["profile"])
            
            success()
            
        }, failure: { (errorMessage) in
            failure(errorMessage)
        })
    }
    
}
