//
//  ProfileCellMenu.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 08/06/21.
//

import UIKit

class ProfileCellMenu: UITableViewCell {

    @IBOutlet weak var profileMenuImage: UIImageView!
    @IBOutlet weak var profileMenuTitle: UILabel!
    @IBOutlet weak var profileMenuSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContent(image: UIImage?, title: String?, subtitle: String?) {
        profileMenuImage.image = image
        profileMenuTitle.text = title
        profileMenuSubtitle.text = subtitle
    }
}
