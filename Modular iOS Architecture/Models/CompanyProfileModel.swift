//
//  CompanyProfileModel.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 16/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import SwiftyJSON

struct CompanyProfileModel {
    
    var companyName: String = ""
    var industry: String = ""
    var description: String = ""
    var chiefExecutiveOfficer: String = ""
    var website: String = ""
    
    init(data: JSON) {
        companyName = data["companyName"].stringValue
        industry = data["industry"].stringValue
        description = data["description"].stringValue
        website = data["website"].stringValue
        chiefExecutiveOfficer = data["ceo"].stringValue
    }
    
}
