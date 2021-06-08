//
//  HomeApi.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 08/06/21.
//

import Foundation

class SportsApi: CoreApi {
    override init() {
        super.init()
        self.URL = server(with: ConstantsApi.LIST_ALL_SPORTS)
    }
}

class LeaguesApi: CoreApi {
    override init() {
        super.init()
        self.URL = server(with: ConstantsApi.LIST_ALL_LEAGUES)
    }
}

class CountriesApi: CoreApi {
    override init() {
        super.init()
        self.URL = server(with: ConstantsApi.LIST_ALL_COUNTRIES)
    }
}
