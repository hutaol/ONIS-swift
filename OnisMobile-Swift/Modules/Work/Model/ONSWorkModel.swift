//
//  ONSWorkModel.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/10.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import HandyJSON

// {"sdstudyno":"S20190100306","msgid":"","sfnnodename":"医生治疗结束确认","flowid":"sys004","subject":"2019-01-24 12:07 病人钱XX外照射计划治疗医生治疗结束确认已受理 科室ID:000002 检查号:S20190100306","planman":"葛超","sdexposureplan":"04","lastchange":"","flowname":"外照射计划治疗","content":"","xpapertype":"sys004_IOD","sdplantype":"IMRT","sdstudygroupid":"P1000000000000000000015647","alladr":"董丽华   董丽华","srstudyflownodeid":"wf_sys004_009","sfnewformversion":"1","srdealflag":"1","navigateurl":"bussiness/StudyReg.ered?reqCode=init&isopeninmaintab=1&opentype=xpaper&studyid=F1000000000000000000007561&xpapertype=sys004_IOD&menuid4Log=010511","cardno":"000002","studyid":"F1000000000000000000007561","mid":"","sdworkflowsign":"","patname":"钱XX"}
struct ONSWorkModel: HandyJSON {
    var sdstudyno: String?
    var msgid: String?
    var sfnnodename: String?
    var flowid: String?
    var subject: String?
    var planman: String?
    var sdexposureplan: String?
    var flowname: String?
    var content: String?
    var xpapertype: String?
    var sdplantype: String?
    var sdstudygroupid: String?
    var alladr: String?
    var srstudyflownodeid: String?
    var sfnewformversion: String?
    var srdealflag: String?
    var navigateurl: String?
    var cardno: String?
    var studyid: String?
    var mid: String?
    var sdworkflowsign: String?
    var patname: String?
}
