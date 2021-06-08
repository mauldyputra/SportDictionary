//
//  HomeViewModel.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 08/06/21.
//

import Foundation

protocol HomeDelegate : class {
    func success()
    func failedReq(message: String)
}

class HomeViewModel {
    weak var delegate: HomeDelegate?
    var sportsApi = SportsApi()
    var leaguesApi = LeaguesApi()
    var countriesApi = CountriesApi()
    
    var sportsModel: SportsModel?
    var leaguesModel: LeaguesModel?
    var countriesModel: CountriesModel?
    
    init() {
        sportsApi.delegate = self
        leaguesApi.delegate = self
        countriesApi.delegate = self
    }
    
    func getSportsApi() {
        sportsApi.getRequest()
    }
    
    func getLeaguesApi() {
        leaguesApi.getRequest()
    }
    
    func getCountriesApi() {
        countriesApi.getRequest()
    }
    
    func sportsCount() -> Int{
        return sportsModel?.sports.count ?? 0
    }
    
    func leaguesCount() -> Int {
        return leaguesModel?.leagues.count ?? 0
    }
    
    func countriesCount() -> Int {
        return countriesModel?.countries.count ?? 0
    }
}

extension HomeViewModel: CoreApiDelegate {
    func finish(interFace: CoreApi, responseHeaders: HTTPURLResponse, data: Data) {
        do {
            switch interFace {
            case sportsApi:
                sportsModel = try JSONDecoder().decode(SportsModel.self, from: data)
                delegate?.success()
            case leaguesApi:
                leaguesModel = try JSONDecoder().decode(LeaguesModel.self, from: data)
                delegate?.success()
            case countriesApi:
                countriesModel = try JSONDecoder().decode(CountriesModel.self, from: data)
                delegate?.success()
            default:
                break
            }
        } catch {
            failed(interFace: interFace)
        }
    }
    
    func failed(interFace: CoreApi) {
        delegate?.failedReq(message: ConstantsWarning.ERROR_TECHNICAL)
    }
}
