//
//  StyleViewController.swift
//  CofficionadoTabbed
//
//  Created by Raphzz on 3/6/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class StyleDetailViewController: UIViewController {

    var styleDetailData : NSDictionary!
    
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet var Link: UIButton!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var bestWith: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bestWithPrefix = "Best Made With: " as String
        titleText.text =  styleDetailData["name"] as? String
        
        
        
        // SET BACKGROUND
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!);
        
        
        //Setting data
        descriptionText.text  = styleDetailData["description"] as String
        
        let bestWidthText = styleDetailData["bestWith"] as String
        bestWith.text = bestWithPrefix + bestWidthText
        
        titleImage.image = UIImage(named: styleDetailData["titleImage"] as String);

       
       
        // Do any additional setup after loading the view.
    }

    
    @IBAction func orderBtnAction(sender: UIButton) {
        
        self.performSegueWithIdentifier("ORDER_SEGUE", sender: self)
    }
    
    
    
    @IBAction func backButtonAction(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func reviewButtonAction(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main 17-55-33-709", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("REVIEW") as ReviewAppViewController
        self.presentViewController(vc, animated: true, completion: nil)
        

    }
    
    
    @IBAction func shareButtonAction(sender: AnyObject) {
        
        
        let textToShare = "I learned so much about coffee thanks to grate app you should try it too !"
        
        if let myWebsite = NSURL(string: "www.appliationURLhere.com")
        {
            let objectsToShare = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //New Excluded Activities Code
            activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
            //
            
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var webViewController = (segue.destinationViewController as WebView);
        webViewController.countryName = styleDetailData["name"] as String;
    }
    

}
