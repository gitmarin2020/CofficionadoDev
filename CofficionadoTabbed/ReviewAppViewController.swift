//
//  ReviewAppViewController.swift
//  CofficionadoTabbed
//
//  Created by Vishnu Khaitan on 23/03/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class ReviewAppViewController: UIViewController {

    
    
    @IBOutlet var popUpView: UIView!

    override func viewDidLoad() {
        
        
       // self.view.backgroudImage =
      // self.view.backgroundColor = UIColor.clearColor()
        
        self.popUpView.layer.cornerRadius = 10;
        self.popUpView.layer.masksToBounds = true;
        
        self.popUpView.layer.borderColor = UIColor.blackColor().CGColor;
        self.popUpView.layer.borderWidth = 0.5;

         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!);

      
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func CloseButtonAction(sender: AnyObject) {
      
        if((self.presentingViewController) != nil){
            self.dismissViewControllerAnimated(true, completion: nil)
            println("cancel")
        }
    }
    
    
    @IBAction func reviewButtonAction(sender: AnyObject) {
        
     UIApplication.sharedApplication().openURL(NSURL(string: "https://www.elance.com/php/collab/main/collab.php?bidid=69994741")!)
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
