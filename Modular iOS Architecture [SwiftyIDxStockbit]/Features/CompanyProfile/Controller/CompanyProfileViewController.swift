//
//  CompanyProfileViewController.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 09/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

final class CompanyProfileViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var companyProfileView: CompanyProfileView!
    
    // MARK: - View Model
    
    private var viewModel: CompanyProfileViewModel?
    
    // MARK: - Dependency Injection
    
    static func instantiate(viewModel: CompanyProfileViewModel) -> CompanyProfileViewController {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CompanyProfileViewController") as! CompanyProfileViewController

        viewController.viewModel = viewModel

        return viewController
    }
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        companyProfileView.delegate = self
        companyProfileView.dataSource = self
        companyProfileView.interface = viewModel
        
        viewModel?.getCompanyProfile(success: {
            self.companyProfileView.reloadData()
        }, failure: { (errorMessage) in
            // Handle the error message here
        })
    }
    
}

// MARK: - CompanyPageViewDataSource

extension CompanyProfileViewController: CompanyProfileViewDataSource {
    func numberOfSections(inCompanyProfileView: CompanyProfileView) -> Int {
        return CompanyProfileSection.allCases.count
    }
    
    func companyProfileView(_ companyProfileView: CompanyProfileView, titleForHeaderInSection section: Int) -> String {
        return CompanyProfileSection.allCases[section].title
    }
    
    func companyProfileView(_ companyProfileView: CompanyProfileView, contentForSection section: Int) -> String? {
        switch section {
        case CompanyProfileSection.companyName.number:
            return viewModel?.companyProfileData?.companyName
        case CompanyProfileSection.description.number:
            return viewModel?.companyProfileData?.description
        case CompanyProfileSection.industry.number:
            return viewModel?.companyProfileData?.industry
        case CompanyProfileSection.chiefExecutiveOfficer.number:
            return viewModel?.companyProfileData?.chiefExecutiveOfficer
        case CompanyProfileSection.website.number:
            return viewModel?.companyProfileData?.website
        default:
            return nil
        }
    }
}

// MARK: - CompanyPageViewDelegate

extension CompanyProfileViewController: CompanyProfileViewDelegate {
    func companyProfileView(_ companyProfileView: CompanyProfileView, didTapCloseButton button: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
