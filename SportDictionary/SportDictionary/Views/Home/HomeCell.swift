//
//  HomeCell.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 08/06/21.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var sportsImage: UIImageView!
    @IBOutlet weak var sportsTitle: UILabel!
    @IBOutlet weak var sportsDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
