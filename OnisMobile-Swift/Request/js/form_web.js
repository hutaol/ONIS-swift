
function old_setValues(data, baseUrl) {
    // TODO table
    var tables = document.querySelectorAll("table")
    for (var i = 0; i < tables.length; ++i) {
        var table = tables[i];
        table.style.width = '900px';
//        table.style.marginLeft = '20px';
//        table.style.marginRight = '20px';
    }
    // TODO cardno 显示不全 样式问题 jd-cardno_1
//    addClass(document.getElementsByName('cardno')[0], 'cardno');
    try {
        if (document.getElementsByName('cardno')) {
            var cardnos = document.getElementsByName('cardno');
            for (var i = 0; i < cardnos.length; ++i) {
                var cardno = cardnos[i];
                cardno.style.height = '40px';
                cardno.style.width = '120px';
            }
        }
        
        if (document.getElementsByName('cardno_1')) {
            var cardnos1 = document.getElementsByName('cardno_1');
            for (var i = 0; i < cardnos1.length; ++i) {
                var cardno1 = cardnos1[i];
                cardno1.style.height = '40px';
                cardno1.style.width = '120px';
            }
        }
        
        if (document.getElementsByName('cardno_2')) {
            var cardnos1 = document.getElementsByName('cardno_2');
            for (var i = 0; i < cardnos1.length; ++i) {
                var cardno1 = cardnos1[i];
                cardno1.style.height = '40px';
                cardno1.style.width = '120px';
            }
        }
        
        if (document.getElementsByName('cardno_3')) {
            var cardnos1 = document.getElementsByName('cardno_3');
            for (var i = 0; i < cardnos1.length; ++i) {
                var cardno1 = cardnos1[i];
                cardno1.style.height = '40px';
                cardno1.style.width = '120px';
            }
        }
        
    } catch (e) {

    }
    
    // TODO studystatus
    v = data["sdstudyflag"];
    
    var sdstudyflagDivs = document.getElementsByName("studystatus");
    for (var m = 0; m < sdstudyflagDivs.length; ++m) {
        if (v == "0") {
            // 执行中
            addClass(sdstudyflagDivs[m], "status_zhixingzhong");
        }
        if (v == "F") {
            addClass(sdstudyflagDivs[m], "status_jieshu");
        }
        if (v == "1") {
            addClass(sdstudyflagDivs[m], "status_zhongzhi");
        }
        if (v == "S") {
            addClass(sdstudyflagDivs[m], "status_feizhi");
        }
    }
    
    
    old_js_backgroud_image(baseUrl);
    
    // MARK 治疗安排 背景颜色
    if (data["bgColorFinishedJS"] && data["bgColorFinishedJS"].length > 0) {

        var array = data["bgColorFinishedJS"];
        for(var i = 0; i < array.length; ++i) {

            var item = array[i];
            // 添加class
            try {
                var arr = document.getElementsByName(item);
                for (var j = 0; j < arr.length; ++j) {

                    addClass(arr[j], 'studyAllFinished');
                }
            } catch (e) {
                //如果出问题，换个逻辑执行
                continue;
            }
        }
    }
    
    for (var i in data) {
        try {
            var arr = document.getElementsByName(i);
            for (var j = 0; j < arr.length; j ++) {
                arr[j].value = data[i];
                arr[j].checked = data[i];
            }
            
        } catch (e) {
            //如果出问题，换个逻辑执行
            continue;
        }
        
    }
}

function setValues(data, baseUrl) {
//    var bb = window.document.querySelector('[bb="bbb"]');
//    addClass(bb, 'studyPartFinished');
//    for (const key in data) {
//        try {
//            //执行某个逻辑
//            var span = window.document.querySelector('[data-emname="'+key+'"]').querySelector("span");
//            span.innerHTML = data[key];
//        } catch (e) {
//            //如果出问题，换个逻辑执行
//
//        }
//
//    }
    
//    data-value
    // MARK 治疗安排 studydoflag 1：完成 0：未完成
    // 治疗安排 颜色背景 数组
    // div 08:00-12:00_08:00-08:15_1_thursday
    if (data["bgColorFinishedJS"] && data["bgColorFinishedJS"].length > 0) {
        v = data["bgColorFinishedJS"];
        for(var i = 0; i < v.length; ++i) {
            var item = v[i];
            // 添加class
            try {
                var bgColorFinished = window.document.querySelector('[data-emname="'+item+'"]');
                addClass(bgColorFinished, 'studyAllFinished');
            } catch (e) {
                //如果出问题，换个逻辑执行
                continue;
            }
        }
    }
    
    // MARK 治疗安排 字 pattype=0 添加style mypatient
    
    // 状态图标
//    08:00-12:00_08:00-08:15_1_wednesday
    
    // 蛋疼  添加 class setAttribute("class", "类名") 不好使
     // 治疗单类型  1-首次  2-改野  0-未知
    // oc=sdapplyflag html=sdapplyflag_stamp
    // 治疗单类型 sdapplyflag_stamp  1-首次  2-改野  0-未知
    // div
    if (data["sdapplyflag"] && data["sdapplyflag"].length > 0) {
        
        v = data["sdapplyflag"];

        var flagDiv = window.document.querySelector('[data-emname="sdapplyflag_stamp"]');
        if (flagDiv) {
            if (v == "1") {
                addClass(flagDiv, 'sdapplyflag_shouci')
            }
            if (v == "2") {
                addClass(flagDiv, 'sdapplyflag_gaiye')
            }
            // image baseurl
            new_js_backgroud_image(flagDiv, baseUrl);
        }
        
    }
    
    // sdexeccontentflag    sdexeccontentflag_stamp
    if (data["sdexeccontentflag"] && data["sdexeccontentflag"].length > 0) {
        v = data["sdexeccontentflag"];

        var flagDiv = window.document.querySelector('[data-emname="sdexeccontentflag_stamp"]');
        if (flagDiv) {
            if (v == "0") {
                addClass(flagDiv, 'sdexeccontentflag_unconfirmed')
            }
            if (v == "1") {
                addClass(flagDiv, 'sdexeccontentflag_confirmed')
            }
            // image baseurl
            new_js_backgroud_image(flagDiv, baseUrl);
        }
    }
    
    // 检查状态 data-emname=studystatus
    // sdstudyflag 0=执行中 F=结束
    // F检查结束 0医技确认 1检查中止 2检查申请 S检查废止

    if (data["sdstudyflag"] && data["sdstudyflag"].length > 0) {
        v = data["sdstudyflag"];

        var stutusDiv = window.document.querySelector('[data-emname="studystatus"]');
        if (stutusDiv) {
            if (v == "0") {
                // 执行中
                addClass(stutusDiv, "status_zhixingzhong");
            }
            if (v == "F") {
                addClass(stutusDiv, "status_jieshu");
            }
            if (v == "1") {
                addClass(stutusDiv, "status_zhongzhi");
            }
            if (v == "S") {
                addClass(stutusDiv, "status_feizhi");
            }
            // image baseurl
            new_js_backgroud_image(stutusDiv, baseUrl);

        }
        
    }
    
    var aElements = document.getElementsByTagName("span");
    var aEle = [];
    for(var i=0; i<aElements.length; i++){
        for (var k in data){
            try {
                if(aElements[i].getAttribute("data-emname") == k){
                    // 性别
                    elem = aElements[i];
                    v = data[k];
                    if (k == "sex") {
                        if ( v == "1" ) {
                            v = "男";
                        } else if (v == "2") {
                            v = "女";
                        }
                    }
                    
                    // 病人类型
                    if (k == "pattype") {
                        if (v == "0") {
                            v = "门诊";
                        } else if (v == "1") {
                            v = "住院";
                        }
                    }
                    
                    // 骨扫描或PET CT史（2天内）： 无
                    if (k == "rayirradiation") {
                        if (v == "rayirradiation_no") {
                            v = "无";
                        } else {
                            v = "有";
                        }
                    }
                    
                    // 放射性粒子植入、核素治疗史： 无
                    if (k == "sourceimplantation") {
                        if (v == "sourceimplantation_no") {
                            v = "无";
                        } else {
                            v = "有";
                        }
                    }
                    
                    // 扫描方式：     scanmode
//                    {"rmcontentRadio":"0","rmcontentTable":[{"code":"scan","codedesc":"平扫","remark":"","exception":"0"},{"code":"enhance","codedesc":"增强","remark":"","exception":"0"},{"code":"scan+enhance","codedesc":"平扫+增强","remark":"","exception":"0"}]}
                    if (k == "scanmode") {
                        if (v == "scan") {
                            v = "平扫";
                        } else if (v == "enhance") {
                            v = "增强";
                        } else if (v == "scan+enhance") {
                            v = "平扫+增强";
                        } else {
                            v = "";
                        }
                    }
                    
                    // 进入方式：    scandirection
                    // {"rmcontentRadio":"0","rmcontentTable":[{"code":" txj","codedesc":"头先进","remark":"","exception":"0"},{"code":"jxj","codedesc":"脚先进","remark":"","exception":"0"}]}
                    if (k == "scandirection") {
                        if (v == " txj") {
                            v = "头先进";
                        } else if (v == " jxj") {
                            v = "脚先进";
                        }
                    }
                    
                    // bolus
//                    {"rmcontentRadio":"0","rmcontentTable":[{"code":"bolus_yes","codedesc":"有","remark":"S00045","exception":"0"},{"code":"bolus_no","codedesc":"无","remark":"S00046","exception":"0"}]}
                    if (k == "bolus") {
                        if (v == "bolus_yes") {
                            v = "有";
                        } else if (v == "bolus_no") {
                            v = "无";
                        }
                    }
                    
                    // 检查设备(治疗设备) sdapplyseid sys001-定位机 sys004-TRUEBEAM
                    if (k == "sdapplyseid") {
                        if (v == "sys001") {
                            v = "定位机";
                        } else if (v == "sys002") {
                            v = "瓦里安模拟复位机";
                        } else if (v == "sys003") {
                            v = "Eclipse计划系统";
                        } else if (v == "sys004") {
                            v = "TRUEBEAM";
                        }
                    }
                    
                    // 4dct
                   // {"rmcontentRadio":"0","rmcontentTable":[{"code":"4DCT","codedesc":"4DCT","remark":"","exception":"0"}]}
                    if (k == "4dct") {
                        if (v.length > 0) {
                            v = "4DCT";
                        }
                    }
                    
                    // 治疗设备     studyiodinformation
//                {"planno":"","sdraylocation":"","pfexpectednum":"","pfeverydaytimes":"","sdapplysename":"","sdplantype":"0","sdexposureplan":"01","course":"","pfeveryweektimes":"","sdapplyflag":"1","sdplanname":"","sdfieldnum":"","smark1":"","sdexpectednum":"2","sdapplyseid":"sys004"}
                    
//                    if (k == "studyiodinformation") {
//                        if ==
//                    }
                    
                    // 治疗类型 sdplantype
                    if (k == "sdplantype") {
                        if (v == "0") {
                            v = "CRT";
                        } else if (v == "1") {
                            v = "IMRT";
                        } else if (v == "2") {
                            v = "VMAT";
                        } else if (v == "3") {
                            v = "SBRT";
                        }
                    }
                    
                    // 分割方案
                    if (k == "sdexposureplan") {
                        if (v == "01") {
                            v = "连续";
                        } else if (v == "06") {
                            v = "分割";
                        } else if (v == "02") {
                            v = "常规分割";
                        } else if (v == "03") {
                            v = "超分割";
                        } else if (v == "04") {
                            v = "加速分割";
                        } else if (v == "05") {
                            v = "大分割";
                        } else if (v == "06") {
                            v = "";
                        }
                    }
                    
                    // 计划系统     sdtps
                    if (k == "sdtps") {
                        if (v == "sys001") {
                            v = "";
                        } else if (v == "sys003") {
                            v = "Eclipse计划系统";
                        }
                    }
                    // 分期标准： TNM分期
                    // clstagetype
                    if (k == "clstagetype") {
                        if (v == "1") {
                            v = "TNM分期";
                        } else {
                            v = "FIGO分期";
                        }
                    }
                    
                    // 照射部位
                    if (k == "sdraylocation") {
                        if (v == "01") {
                            v = "头部";
                        }
                    }
                    
                    elem.children[0].innerHTML = v;
                    
                    // MARK 字颜色 pattype  mypatient
                    // 包含 _adr _adr_pattype=0
                    if (k.indexOf("_adr") != -1) {
                        var n_k = k+"_pattype";

                        if (data[n_k] == "0") {
                            addClass(elem.children[0], "mypatient");
                        }
                    }
                    
                    // MARK 时间今天 红色 包含date
                    if (k.indexOf("date") != -1) {
                        var dayStr = new Date().format("yyyy-MM-dd");
                        if (v == dayStr) {
                            var elementPoint = parseInt(elem.attributes["data-element-point"].value);
                            var tdPoint = elementPoint-2;
                            
                            var tdelem = window.document.querySelector('[data-element-point="'+tdPoint+'"]');
                            tdelem.style.color = "red";
                        }
                    }
                
                }
            } catch (e) {
                //如果出问题，换个逻辑执行
                continue;
            }
        }
    }
    
}

function addClass( elements, cName ){
    if( !hasClass( elements,cName ) ){
        elements.className += " " + cName;
    };
};

function hasClass( elements, cName ){
    return !!elements.className.match( new RegExp( "(\\s|^)" + cName + "(\\s|$)") ); // ( \\s|^ ) 判断前面是否有空格 （\\s | $ ）判断后面是否有空格 两个感叹号为转换为布尔值 以方便做判断
};

function getStyle(oElement, sName){
    return oElement.currentStyle ? oElement.currentStyle[sName] : getComputedStyle(oElement, null)[sName];
}

function old_js_setValues(baseUrl) {
    
    // lz-string 
//    var box = document.getElementById('appBox').innerText;
//    html = LZString.decompressFromBase64(box);
//    document.getElementById('appBox').innerHTML = html;
    
    var str = document.getElementById("xpaperdataholder").innerText;
    var obj = JSON.parse(str);
    old_setValues(obj, baseUrl);
}

function old_js_backgroud_image(baseUrl) {
    var yy = document.getElementsByName('studystatus');
    for (var j = 0; j < yy.length; j ++) {
        var ee = yy[j];
        var imageurl = getStyle(ee, 'backgroundImage');
        try {
            str = imageurl.match(/(images\S*png)/)[1];

            ee.style.backgroundImage = "url('"+baseUrl+"/RTIS/resource/myux/xpaper/"+ str +"')";
        } catch(e) {
            alert(e);
            continue;
        }
        
    }
}

// 治疗单流程
function treatExecList(data) {

    var table = document.getElementsByName("logs")[0];

    for (var i = 0; i < data.length; i ++) {
        var item = data[i];
        var items = [i+1, item["banci"], item["dt"], item["leiji"], item["baiwei"], item["jilu"], item["yanzhengjilu"], item["yanzhenyishi"], item["yuanhuodu"]];
        // 一行
        var tr = table.getElementsByTagName('tr')[i+1];
        var tds = tr.getElementsByTagName('td');

        for (var j = 0; j < items.length; j ++) {
            var td = tds[j];
            try {

                td.innerText = items[j]

            } catch(e) {
                alert("treatExecList:"+e);
                continue;
            }
        }

    }

}

function new_js_backgroud_image(em, baseUrl) {

    var imageurl = getStyle(em, 'backgroundImage');
    str = imageurl.match(/(images\S*png)/)[1];
    em.style.backgroundImage = "url('"+baseUrl+"/RTIS/app/expand/plugin/"+ str +"')";

}

Date.prototype.format = function(fmt) {
    var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "h+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S"  : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt)) {
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
    return fmt;
}

