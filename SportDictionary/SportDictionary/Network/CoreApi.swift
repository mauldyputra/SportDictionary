//
//  CoreApi.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import UIKit
import Alamofire

@objc protocol CoreApiDelegate {
    @objc func finish(interFace : CoreApi, responseHeaders : HTTPURLResponse, data : Data)
    @objc func failed(interFace : CoreApi)
    @objc optional func connectionFailure()
}

enum CoreApiResponseStatus {
    case success(_ : HTTPURLResponse, _ : Data)
    case failed(_: String, _: String)
}

class CoreApi: NSObject {
    var URL = ""
    var encoding: ParameterEncoding = URLEncoding.default
    weak var delegate : CoreApiDelegate?
    var method : HTTPMethod = .get
    var isAuthorization = true
    var contentType = "application/json"
    
    func getRequest(completion: ((CoreApiResponseStatus) -> Void)? = nil) {
        var param = getParam()
        
        AF.request(URL, method: method, parameters : param, encoding: encoding) { (urlRequest: inout URLRequest) in
            urlRequest.timeoutInterval = 30
        }.validate().responseJSON { response in
            #if !RELEASE_SETTING
            print("Param >>> \(param)")
            print("URL Request >>> \(String(describing: response.request))")  // original URL request
            print("statusCode >>> \(String(describing: response.response?.statusCode))\n\n")
            do{
                if let responseValue = response.value, !(responseValue is NSNull) {
                    let jsonData = try JSONSerialization.data(withJSONObject: responseValue, options: [.prettyPrinted])
                    let responseString = String(data: jsonData, encoding: .utf8)!
                    print("Param >>> \(param)")
                    print("Response >>> \(responseString)\n\n")
                }
            }catch{}
            #endif
            
            switch (response.response?.statusCode) {
            case 200,201:
                guard let data = response.data else { return }
                guard let responseHeader = response.response else { return }
                self.success(responseHeaders: responseHeader, data: data)
                completion?(.success(responseHeader, data))
            default:
                self.failed()
                if self.isConnectedToInternet() {
                    completion?(.failed(ConstantsWarning.TITLE_ERROR_API,
                                        ConstantsWarning.MESSAGE_ERROR_API))
                } else {
                    // Handle if lose connection
                    completion?(.failed(ConstantsWarning.TITLE_CONNECTION_FAILURE,
                                        ConstantsWarning.MESSAGE_CONNECTION_FAILURE))
                    
                    let vc = NoConnectionViewController()
                    UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    func getParam() -> [String : Any]  {
        return [:]
    }
    
    func success(responseHeaders : HTTPURLResponse, data : Data) {
        delegate?.finish(interFace: self, responseHeaders : responseHeaders, data : data)
    }
    
    func failed() {
        delegate?.failed(interFace: self)
    }
    
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    
        public func server(with api: String) -> String {
            let serverURL = "\(ConstantsApi.getBaseApi())\(api)"
            return serverURL
        }
}
