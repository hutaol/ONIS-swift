//
//  HTWebViewController.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/10.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import WebKit

private let titleKeyPath = "title"
private let estimatedProgressKeyPath = "estimatedProgress"


class HTWebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(url: String) {
        super.init(nibName: nil, bundle: nil)
        self.url = url
    }
    
    var url = String()
    
    
    lazy var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)

        webView.addObserver(self, forKeyPath: estimatedProgressKeyPath, options: .new, context: nil)
        webView.addObserver(self, forKeyPath: titleKeyPath, options: .new, context: nil)

        if #available(iOS 9.0, *) {
            webView.allowsLinkPreview = true
        }
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
//        webView.allowsBackForwardNavigationGestures = true
//        webView.isMultipleTouchEnabled = true
        return webView
    }()
    
    lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.backgroundColor = .clear
        progressBar.trackTintColor = .clear
        return progressBar
    }()
    
   
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.edgesForExtendedLayout = [.bottom]
        
        self.setupView()
        
        self.requestData()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        webView.stopLoading()
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: titleKeyPath, context: nil)
        webView.removeObserver(self, forKeyPath: estimatedProgressKeyPath, context: nil)
    }
    
    // observe title progress
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case estimatedProgressKeyPath?:
            self.updateProgress()
        case titleKeyPath?:
            navigationItem.title = webView.title
        default:
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}

extension HTWebViewController {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        webView.evaluateJavaScript("old_setValues('', '')") { (htmlStr, error) in
            mPrint("ddddddd:", htmlStr, error)
        }
    }
}

extension HTWebViewController {
    
    func setupView() {
        self.view.addSubview(self.webView)
        self.view.addSubview(self.progressBar)

        self.progressBar.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(2)
        }
        self.webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.load()
    }
    
    func updateProgress() {
        let completed = self.webView.estimatedProgress == 1.0
        progressBar.setProgress(completed ? 0.0 : Float(webView.estimatedProgress), animated: !completed)
        UIApplication.shared.isNetworkActivityIndicatorVisible = !completed
    }
    
    func load() {
        let urlRequest = URLRequest.init(url: URL.init(string: self.url)!)
        webView.load(urlRequest)
    }
    
    func requestData() {
        Network.request(.webForm, success: { (json) in
            
            if json["success"].boolValue {
                let extrainfo = json["extrainfo"].stringValue
                
                let datas = NSDictionary.init()
                
                let infoDic: NSDictionary = self.getDictionaryFromJSONString(jsonString: extrainfo) as NSDictionary

                let record: String = infoDic["record"] as! String

                let recordDic: NSDictionary = self.getDictionaryFromJSONString(jsonString: record)
                
                let htmlString = json["htmlcontent"].stringValue;


                let html = "<!DOCTYPE html><html><head lang=\"zh\"><meta charset=\"UTF-8\"><link rel=\"stylesheet\" type=\"text/css\" href=\"form_style_old.css\"><script type=\"text/javascript\" src=\"form_web.js\"></script></head><body><div id='app'><div id='appBox' contenteditable='false' class='cke_textarea_inline cke_editable cke_editable_inline cke_contents_ltr cke_show_borders cke_focus view' tabindex='0' spellcheck='false' role='textbox' aria-multiline='true' aria-label='false'>\(htmlString)</div></div></body></html>"
                let baseURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
                self.webView.loadHTMLString(html, baseURL: baseURL)
                
            }
            
            
            
        }, error: { (code) in
            
        }) { (error) in
            
        }
    }
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
    }
}

