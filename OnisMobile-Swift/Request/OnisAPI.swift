//
//  OnisAPI.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/3.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import Foundation
import Moya

let OnisProvider = MoyaProvider<OnisAPI>()

enum OnisAPI {
    // 登录
    case login(account: String, password: String)
    case logout(_ account: String, _ password: String)
    case userInfo(userId: String)
    
    case work(workid: Int)
    case taskSummery(loginuserid: String, type: Int)
    case workflow
    // 待办工作
    case doingWork(start: Int, limit: Int, type: String, searchstr: String, flowname: String)
    case doneWork       // 已办工作
    case webForm
}

extension OnisAPI: TargetType {
    // 服务器地址
    public var baseURL: URL {
        return URL(string: serverAddress)!
        
    }
    
    var path: String {
        switch self {
        case .login: return "/RTIS/login.ered"
        case .logout: return "/RTIS/login.ered"
        case .userInfo: return "/RTIS/index.ered"
            
            
        case .work: return "work"
        case .taskSummery: return "/RTIS/bussiness/WorkFlow.ered?reqCode=queryMyTasksSummery"
        case .workflow: return "/RTIS/bussiness/WorkFlow.ered"
        case .doingWork: return "/RTIS/bussiness/WorkFlow.ered"
        case .doneWork: return "/RTIS/bussiness/WorkFlow.ered"
        case .webForm: return "/RTIS/bussiness/PatientManager.ered"
        }
    }
    
    var method: Moya.Method { return .get }
    
    var task: Task {
        var parmeters:[String:Any] = [:]
        switch self {
        case .login(let account, let password):
            parmeters = ["account": account, "password": password, "reqCode": "login"]
        case .logout(let account, let password):
            parmeters = ["account": account, "password": password, "reqCode": "logout"]
        case .userInfo(let userId):
            parmeters = ["userid": userId, "reqCode": "loadUserInfo"]

            
            
        case .work(let workid):
            parmeters["workid"] = workid
        case .taskSummery(let loginuserid, let type):
            parmeters["loginuserid"] = loginuserid
            parmeters["type"] = type
        case .workflow:
            parmeters["reqCode"] = "getMessages"
            parmeters["loginuserid"] = "10000004"
        case .doingWork(let start, let limit, let type, let searchstr, let flowname):
            parmeters["reqCode"] = "queryMyTasksDoing"
            parmeters["loginuserid"] = currentUser.userid

            if start != 0 { parmeters["start"] = start }
            if limit != 0 { parmeters["limit"] = limit }
            if !type.isEmpty { parmeters["type"] = type }
            if !searchstr.isEmpty { parmeters["searchstr"] = searchstr }
            if !flowname.isEmpty { parmeters["flowname"] = flowname }
            
            
        case .doneWork:
            parmeters["reqCode"] = "queryMyTasksDoing"
        case .webForm:
            parmeters["reqCode"] = "queryForStudyYiJiDan"
            parmeters["loginuserid"] = "10000004"
            parmeters["bGetExtraInfo"] = "true"
            parmeters["mouldtype"] = "sys00401"
            parmeters["recordid"] = "F1000000000000000000007883"

            
        }

        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)

    }
    
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? { return nil }

}


