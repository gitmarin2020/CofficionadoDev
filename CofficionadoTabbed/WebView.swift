//
//  WebView.swift
//  CofficionadoTabbed
//
//  Created by Baati on 16/03/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit


class WebView: UIViewController , UIWebViewDelegate{
    
    
    var countryName:String! // contains the name of country from previous screen

    
      @IBOutlet var WebView: UIWebView!
      @IBOutlet var activicityIndicator: UIActivityIndicatorView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
       // *********************  Loading webview with URL **********************//
        //sample URl = http://www.mttamcoffeecompany.com/shop/Brazil
            
        let baseURL = "http://www.mttamcoffeecompany.com/shop/"
        var urlString = baseURL + countryName;
        print(urlString)
        var URL = NSURL(string: urlString)  // Need to replace xxxx value
        WebView.delegate=self;
        WebView.loadRequest(NSURLRequest(URL:URL!))
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: UIWebview Delegates
    
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

  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
