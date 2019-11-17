//
//  CompanyPageTableViewCell.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 16/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

final class CompanyProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var content: String? {
        didSet {
            if let content = content {
                if content.isEmpty {
                    contentLabel.text = "N/A"
                } else {
                    contentLabel.text = content
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentLabel.text = ""
    }
    
}
