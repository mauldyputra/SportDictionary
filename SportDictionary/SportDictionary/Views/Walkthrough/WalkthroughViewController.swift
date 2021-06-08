//
//  WalkthroughViewController.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import Foundation
import SnapKit

class WalkthroughViewController: UIViewController {
    
    private lazy var walkthroughView: WalkthroughView = { [unowned self] in
        let walkthroughView  = WalkthroughView(frame: .zero)
        return walkthroughView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // back
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
    }
    
    override func loadView() {
        self.navigationController?.isNavigationBarHidden = true
        
        walkthroughView.delegate = self
        self.view = walkthroughView
        let messageList = getWalkthroughList()
        walkthroughView.setContent(messageList: messageList)
    }
    
    private func getWalkthroughList () -> [String] {
        let walkthrough1 = "Walkthrough 1"
        let walkthrough2 = "Walkthrough 2"
        let walkthrough3 = "Walkthrough 3"
        
        let walkthroughList:[String] = [walkthrough1, walkthrough2, walkthrough3]
        
        return walkthroughList
    }
    
    func goToHome() {
        UserDefaultManager.instance.walkthroughShown = true
        let homeVC = MainViewController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
}

extension WalkthroughViewController : WalkhthroughViewDelegate {
    func skipPressed() {
        goToHome()
    }
    
    func finished() {
        goToHome()
    }
}
