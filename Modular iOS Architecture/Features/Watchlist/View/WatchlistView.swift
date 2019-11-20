//
//  WatchlistView.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

protocol WatchlistViewDelegate: class {
    func watchlistView(_ view: WatchlistView, didSelectRowAt indexPath: IndexPath)
}

protocol WatchlistViewDataSource: class {
    func watchlistView(_ view: WatchlistView, modelForRowAt indexPath: IndexPath) -> WatchlistCellInterface
    func watchlistView(numberOfInSection section: Int, in view: WatchlistView) -> Int
}

protocol WatchlistViewInterface: WatchlistCellInterface {}

final class WatchlistView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: WatchlistViewDelegate?
    weak var dataSource: WatchlistViewDataSource?
    
    let loadingIndicatorView = UIActivityIndicatorView(style: .gray)
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Registering the WatchlistTableViewCell
        let watchlistCellNib = UINib(nibName: "WatchlistTableViewCell", bundle: nil)
        tableView.register(watchlistCellNib, forCellReuseIdentifier: "WatchlistTableViewCell")
        
        // This is to remove seperator lines of empty cells
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - View Methods
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showLoadingIndicator() {
        tableView.backgroundView = loadingIndicatorView
        loadingIndicatorView.startAnimating()
    }
    
    func hideLoadingIndicator() {
        tableView.backgroundView = nil
    }
    
}

// MARK: - UITableViewDataSource

extension WatchlistView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.watchlistView(numberOfInSection: section, in: self) ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchlistTableViewCell", for: indexPath) as! WatchlistTableViewCell
        
        if let interface = dataSource?.watchlistView(self, modelForRowAt: indexPath) {
            cell.interface = interface
        }
        
        return cell
    }
}
 
// MARK: - UITableViewDelegate

extension WatchlistView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.watchlistView(self, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
