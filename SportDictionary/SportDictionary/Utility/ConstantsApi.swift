//
//  ConstantsApi.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import Foundation

struct ConstantsApi{
    
    static let API_BASE = "https://www.thesportsdb.com/api/v1/json/1"
    
    static let LIST_ALL_SPORTS = "\(API_BASE)/all_sports.php"
    static let LIST_ALL_LEAGUES = "\(API_BASE)/all_leagues.php"
    static let LIST_ALL_COUNTRIES = "\(API_BASE)/all_countries.php"
}
