//
//  Menu.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 08/06/21.
//

import UIKit

class Menu {
    var menuIcon: UIImage?
    var menuTitle: String?
    var menuSubtitle: String?
    
    init(menuIcon: String, menuTitle: String?, menuSubtitle: String?) {
        self.menuIcon = UIImage(named: menuIcon)
        self.menuTitle = menuTitle
        self.menuSubtitle = menuSubtitle
    }
    
    func getMenuIcon() -> UIImage {
        return self.menuIcon ?? UIImage()
    }
    
    func getMenuTitle() -> String {
        return self.menuTitle ?? ""
    }
    
    func getMenuSubtitle() -> String {
        return self.menuSubtitle ?? ""
    }
}
