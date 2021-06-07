//
//  NoConnectionViewController.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import UIKit

class NoConnectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tryAgainTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
