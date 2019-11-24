//
//  WatchlistTableViewCell.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 04/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

protocol WatchlistCellInterface {
    var companySymbol: String { get }
    var companyName: String { get }
    
    var price: String { get }
    var percentageChange: String { get }
}

final class WatchlistTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var percentageChangeLabel: UILabel!
    
    @IBOutlet weak var priceContainerView: UIView!
    
    // MARK: - Overrides
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        priceContainerView.layer.cornerRadius = 3.0
    }
    
    // MARK: - Dependency Injection
    
    var interface: WatchlistCellInterface? {
        didSet {
            if let interface = interface {
                symbolLabel.text = interface.companySymbol
                nameLabel.text = interface.companyName
                
                priceLabel.text = interface.price
                percentageChangeLabel.text = interface.percentageChange
            }
        }
    }
    
}
