//
//  DidYouKnowViewController.swift
//  CofficionadoTabbed
//
//  Created by Shahrukh on 19/03/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class DidYouKnowViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var didYouKnowTable: UITableView!
    
    
    
    var didYouKnowArray = [
        [
            "name"  : "Coffee Brewing Methods",
            "image" : "brewing_methods.jpg"
        ],
        
        [
            "name"  : "Coffee Knowledge",
            "image" : "infographic3.jpg"
        ]
        ,
        [
            "name"  : "How Coffee Changed America",
            "image" : "infographic1.jpg"
        ]
    ];

    
    
    var selectedRow = "";



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // SET BACKGROUND
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!);
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // MARK: - UITableview Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return didYouKnowArray.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
            var cell = UITableViewCell();
            let text = didYouKnowArray[indexPath.row]["name"];
           
            cell.textLabel?.text = text;
            cell.textLabel?.font = UIFont (name: "Gill Sans", size: 20)
            cell.textLabel?.textColor = UIColor.whiteColor();
            cell.backgroundColor = UIColor.clearColor()
            
            return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRow = didYouKnowArray[indexPath.row]["image"]!
        self.performSegueWithIdentifier("INFOGRAPHICS-SEGUE", sender:self)
        return;
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         //Get the new view controller using segue.destinationViewController.
         //Pass the selected object to the new view controller.
        
        var infoGraphicsController = (segue.destinationViewController as InfoGraphicsViewController);
        infoGraphicsController.imageName = selectedRow
        
       
    }


    @IBAction func revieeButtonAction(sender: AnyObject) {
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
