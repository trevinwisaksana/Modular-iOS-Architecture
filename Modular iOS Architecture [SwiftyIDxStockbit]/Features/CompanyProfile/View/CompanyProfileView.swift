//
//  CompanyProfileView.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 09/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

protocol CompanyProfileViewDelegate: class {
    func companyProfileView(_ companyProfileView: CompanyProfileView, didTapCloseButton button: UIButton)
}

protocol CompanyProfileViewDataSource: class {
    func numberOfSections(inCompanyProfileView: CompanyProfileView) -> Int
    func companyProfileView(_ companyProfileView: CompanyProfileView, titleForHeaderInSection section: Int) -> String
    func companyProfileView(_ companyProfileView: CompanyProfileView, contentForSection section: Int) -> String?
}

protocol CompanyProfileViewInterface {
    var companySymbol: String? { get }
    var companyName: String? { get }
}

final class CompanyProfileView: XibView {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var companySymbolLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: - Dependency Injection
    
    var interface: CompanyProfileViewInterface? {
        didSet {
            if let interface = interface {
                companySymbolLabel.text = interface.companySymbol
                companyNameLabel.text = interface.companyName
            }
        }
    }
    
    // MARK: - Delegate & Data Source
    
    weak var delegate: CompanyProfileViewDelegate?
    weak var dataSource: CompanyProfileViewDataSource?
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register CompanyProfileTableViewCell
        let companyProfileCellNib = UINib(nibName: "CompanyProfileTableViewCell", bundle: nil)
        tableView.register(companyProfileCellNib, forCellReuseIdentifier: "CompanyProfileTableViewCell")
        
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - IBAction
    
    @IBAction func didTapCloseButton(_ sender: UIButton) {
        delegate?.companyProfileView(self, didTapCloseButton: sender)
    }
    
    // MARK: -
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource

extension CompanyProfileView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections(inCompanyProfileView: self) ?? .zero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyProfileTableViewCell", for: indexPath) as! CompanyProfileTableViewCell
        
        if let content = dataSource?.companyProfileView(self, contentForSection: indexPath.section) {
            cell.content = content
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CompanyProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource?.companyProfileView(self, titleForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
