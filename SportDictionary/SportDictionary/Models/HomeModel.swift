//
//  HomeModel.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 08/06/21.
//

import Foundation

// MARK: - SportsModel
struct SportsModel: Codable {
    let sports: [dataSports]
}

// MARK: - Sport
struct dataSports: Codable {
    let idSport, strSport, strFormat, strSportDescription: String
    let strSportThumb: String
    
    enum CodingKeys: String, CodingKey {
        case idSport = "idSport"
        case strSport = "strSport"
        case strFormat = "strFormat"
        case strSportDescription = "strSportDescription"
        case strSportThumb = "strSportThumb"
    }
}

// MARK: - LeaguesModel
struct LeaguesModel: Codable {
    let leagues: [dataLeagues]
}

// MARK: - League
struct dataLeagues: Codable {
    let idLeague, strLeague: String
    let strSport: String
    let strLeagueAlternate: String?
    
    enum CodingKeys: String, CodingKey {
        case idLeague = "idLeague"
        case strLeague = "strLeague"
        case strSport = "strSport"
        case strLeagueAlternate = "strLeagueAlternate"
    }
}

// MARK: - CountriesModel
struct CountriesModel: Codable {
    let countries: [dataCountries]
}

// MARK: - Country
struct dataCountries: Codable {
    let nameEn: String

    enum CodingKeys: String, CodingKey {
        case nameEn = "name_en"
    }
}
