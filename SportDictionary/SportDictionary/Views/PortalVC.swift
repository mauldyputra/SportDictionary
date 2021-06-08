//
//  PortalVC.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import UIKit

class PortalVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkSession()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func checkSession(){
        if (UserDefaultManager.instance.walkthroughShown) {
            goToHomePage()
        } else {
            goToWalkthrough()
        }
    }
    
    func goToHomePage() {
        let homeVC = MainViewController()
        navigationController?.pushViewController(homeVC, animated: false)
    }
    
    func goToWalkthrough(){
        let walkthroughVC = WalkthroughViewController()
        navigationController?.pushViewController(walkthroughVC, animated: false)
    }
}
