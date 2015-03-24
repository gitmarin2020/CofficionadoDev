//
//  StylesViewController.swift
//  CofficionadoTabbed
//
//  Created by Shahrukh on 19/03/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class StylesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableStyles: UITableView!
    
    var stylesArray : NSArray!
    var selectedIndex : Int!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableStyles.delegate = self;
        tableStyles.dataSource = self;
        
        // SET BACKGROUND
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!);
        
        
        //Getting data from 'Styles.plist' from resource folder
        if let path = NSBundle.mainBundle().pathForResource("Styles", ofType: "plist") {
            stylesArray = NSArray(contentsOfFile: path)
        }
       
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stylesArray.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 138;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
            var cell = UITableViewCell();
            let text = stylesArray[indexPath.row]["name"];
            
            let imageName = stylesArray[indexPath.row]["image"] as String
            var image : UIImage = UIImage(named: imageName)! as UIImage;
            var imageView = UIImageView(image: image);
            imageView.frame = CGRect(x: (tableStyles.bounds.size.width/2) - (316/2), y: 5, width: image.size.width/3, height: image.size.height/3);
            
            cell.addSubview(imageView);
            
            return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath.row
        self.performSegueWithIdentifier("StyleViewController", sender:self)
        return;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var styleViewController = (segue.destinationViewController as StyleDetailViewController);
        styleViewController.styleDetailData = stylesArray[selectedIndex] as NSDictionary;
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }

}
