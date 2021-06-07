//
//  UserDefaultManager.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import Foundation

class UserDefaultManager {
    
    static let KEY_WALKTHROUGH_SHOWN = "walkthroughShown"
    static let instance = UserDefaultManager()
    
    let userDefaults: UserDefaults
    
    private init() {
        self.userDefaults = UserDefaults.standard
    }
    
    var walkthroughShown: Bool {
        get {
            if let walkthroughShown = userDefaults.object(forKey: UserDefaultManager.KEY_WALKTHROUGH_SHOWN) as? Bool {
                return walkthroughShown
            }
            else{
                return false
            }
        }
        set(walkthroughShown) {
            userDefaults.set(walkthroughShown, forKey: UserDefaultManager.KEY_WALKTHROUGH_SHOWN)
        }
    }
}
