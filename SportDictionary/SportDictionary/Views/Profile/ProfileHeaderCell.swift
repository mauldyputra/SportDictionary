//
//  ProfileHeaderCell.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 08/06/21.
//

import UIKit

class ProfileHeaderCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
