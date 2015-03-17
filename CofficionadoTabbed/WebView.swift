//
//  WebView.swift
//  CofficionadoTabbed
//
//  Created by Baati on 16/03/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit


class WebView: UIViewController , UIWebViewDelegate{

    
      @IBOutlet var WebView: UIWebView!
      @IBOutlet var activicityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // *********************  webview **********************//
        var URL = NSURL(string: "http://www.mttamcoffeecompany.com/shop/")  // Need to replace xxxx value
        WebView.delegate=self;
        WebView.loadRequest(NSURLRequest(URL:URL!))
        
        
        
      
    }
    
    //------- delegate method webview start loading
    func webViewDidStartLoad(webView : UIWebView) {
     
        activicityIndicator.hidden=false;
        activicityIndicator.startAnimating();
    }
    
    // ------- delegate method webview end loading

    func webViewDidFinishLoad(webView : UIWebView) {
        
        activicityIndicator.hidden=true;
        activicityIndicator.stopAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
