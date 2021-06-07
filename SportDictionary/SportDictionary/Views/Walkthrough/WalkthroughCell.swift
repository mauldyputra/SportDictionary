//
//  WalkthroughCell.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import UIKit
import FSPagerView

class WalkthroughCell: FSPagerViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContent(text: String) {
        overviewLabel.text = text
        layoutIfNeeded()
    }

}
