//
//  Network.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/5.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON


// log、loading
let networkActivityPlugin = NetworkActivityPlugin { changeType, targetType in
    switch changeType {
    case .began:
        NSLog("显示loading")
    case .ended:
        NSLog("隐藏loading")
    }
}

// 打印输出
let networkLoggerPlugin = NetworkLoggerPlugin(verbose: true, responseDataFormatter: { (data: Data) -> Data in
    //            return Data()
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data) // Data 转 JSON
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted) // JSON 转 Data，格式化输出。
        return prettyData
    } catch {
        return data
    }
})

struct Network {
    static let provider = MoyaProvider<OnisAPI>(plugins: [networkActivityPlugin, networkLoggerPlugin])
    
    static func request(
        _ target: OnisAPI,
        success successCallback: @escaping (JSON) -> Void,
        error errorCallback: @escaping (Int) -> Void,
        failure failureCallback: @escaping (MoyaError) -> Void
        ) {
        
        provider.request(target) { (result) in
            switch result {
            case let .success(response):
                do {
                    // 如果数据返回成功则直接将结果转为JSON
                    try response.filterSuccessfulStatusCodes()
                    let json = try JSON(response.mapJSON())
                    successCallback(json)
                }
                catch let error {
                    // 如果数据获取失败，则返回错误状态码
                    // TODO code = 200 json解析出错
                    let code = (error as! MoyaError).response!.statusCode
                    if code == 200 {
                        do {
                            var str = try (error as! MoyaError).response!.mapString()
                            // 用户信息
                            if str.contains("success") && !str.contains("\"success\"") {
                                str = str.replacingOccurrences(of: "success", with: "\"success\"")
                            }
                            if str.contains("data") && !str.contains("\"data\"") {
                                str = str.replacingOccurrences(of: "data", with: "\"data\"")
                            }
                            if str.contains("TOTALCOUNT") && !str.contains("\"TOTALCOUNT\"") {
                                str = str.replacingOccurrences(of: "TOTALCOUNT", with: "\"TOTALCOUNT\"")
                            }
                            if str.contains("ROOT") && !str.contains("\"ROOT\"") {
                                str = str.replacingOccurrences(of: "ROOT", with: "\"ROOT\"")
                            }
                            
                            let json = JSON(parseJSON: str)
                            successCallback(json)
                            
                        } catch let error {
                            errorCallback((error as! MoyaError).response!.statusCode)

                        }
                        
                    } else {
                        errorCallback((error as! MoyaError).response!.statusCode)
                    }
                }
            case let .failure(error):
                // 如果连接异常，则返回错误信息
                failureCallback(error)
            }

        }
    }
}
