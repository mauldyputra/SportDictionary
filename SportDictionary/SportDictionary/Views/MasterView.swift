//
//  MasterView.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import UIKit
import Gluten

class MasterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    func setupView() {
        self.glueSourceAndView()
        
        for view in subviews {
            view.setNeedsLayout()
            view.layoutIfNeeded()
        }
    }
}
