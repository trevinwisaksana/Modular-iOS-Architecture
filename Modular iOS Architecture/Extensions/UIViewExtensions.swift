//
//  UIViewExtensions.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

/// Makes views that are created using nib files visible when refrenced in Storyboards or other UINib files.
@IBDesignable
class XibView: UIView {
    
    public var contentView: UIView?
    
    // MARK: - Setup
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
        contentView?.prepareForInterfaceBuilder()
    }
    
    private func setup() {
        guard let view = loadViewFromNib() else {
            return
        }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let nibName = String(describing: type(of: self))

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
