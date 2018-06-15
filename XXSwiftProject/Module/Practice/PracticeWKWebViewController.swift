//
//  PracticeWKWebViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/4/8.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class PracticeWKWebViewController: UIViewController {
    
    lazy var webView: WKWebView = {
        var config = WKWebViewConfiguration()
        
        let wv = WKWebView(frame: self.view.bounds, configuration: config)
        wv.navigationDelegate = self
        wv.uiDelegate = self
        
        //进度监听
        wv.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
       
        return wv
    }()
    
    lazy var progressView: UIProgressView = {
        let pv = UIProgressView(frame: CGRect(x: 0, y: 64, width: self.view.bounds.size.width, height: 2))
        pv.trackTintColor = UIColor.clear
        pv.progressTintColor = UIColor.green
        return pv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        view.addSubview(progressView)
        
        webView.load(URLRequest(url: URL.init(string: "https://www.jianshu.com/p/39031781d628")!))
        
        webView.goBack()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let webView = object as? WKWebView, keyPath == "estimatedProgress" else {
            return
        }
        progressView.progress = Float(webView.estimatedProgress)
        progressView.isHidden = (progressView.progress >= 1)
    }
}

extension PracticeWKWebViewController: WKNavigationDelegate,WKUIDelegate {
   
    /// 页面开始加载
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation...")
    }
    
    /// 页面加载完成
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish...")
        
        // 获取内容高度
        webView.evaluateJavaScript("document.body.scrollHeight") { (height, error) in
            print(height as! Float)
        }
    }
    
    /// 跳转失败的时候调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("didFail...")
    }
    
    /// 内容加载失败
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("didFailProvisionalNavigation...")
    }
   
    /// 执行JS注入方法
    func webViewUserContentController(_ scriptMessageHandlerArray:[String], didReceive message: WKScriptMessage) {
        
    }
    
    /// JS执行回调方法
    func webViewEvaluateJavaScript(_ result:Any?,error:Error?) {
        
    }
    
}
