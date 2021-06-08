//
//  MainViewController.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import UIKit

class MainViewController: UITabBarController{
    
    var profileNav: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        NotificationCenter.default.addObserver(self, selector: #selector(setupProfileTab), name: NSNotification.Name("notificationSetupTabbar"), object: nil)
    }
    
    @objc func setupTabbar() {
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController:  homeVC)
        let homeTabbarItem = UITabBarItem(title: "Sports List", image: UIImage(named: ""), tag: 0)
        homeTabbarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem = homeTabbarItem
        
        setupProfileTab()
        
        self.viewControllers = [homeNav, profileNav]
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.rgb(red: 32, green: 92, blue: 145)
        tabBar.unselectedItemTintColor = UIColor.rgb(red: 109, green: 114, blue: 120)
    }
    
    @objc func setupProfileTab() {
        if profileNav == nil {
            profileNav = UINavigationController()
            let profileTabbarItem = UITabBarItem(title: "Profil", image: UIImage(named: ""), tag: 0)
            profileTabbarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
            profileNav.tabBarItem = profileTabbarItem
        }
        
        profileNav.viewControllers.removeAll()
        
        let profile = ProfileViewController()
        profileNav.isNavigationBarHidden = true
        profileNav.pushViewController(profile, animated: true)
    }
}
