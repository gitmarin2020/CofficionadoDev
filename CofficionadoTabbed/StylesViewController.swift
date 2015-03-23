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
    
    var styles = [
        "The Americano",
        "The Cappucinno",
        "The Espresso",
        "The Flatwhite",
        "The Galao",
        "The Icecoffee",
        "The Latte",
        "The Macchiato",
        "The Melange",
        "The Tripplo",
        "The Viennese"
    ];
    
    var stylesImgs = [
        "americano",
        "cappucinno",
        "espresso",
        "flatwhite",
        "galao",
        "icecoffee",
        "latte",
        "macchiato",
        "melange",
        "tripplo",
        "viennese"
    ];
    
    var selectedRow = "";
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableStyles.delegate = self;
        tableStyles.dataSource = self;
        
        // SET BACKGROUND
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!);
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stylesImgs.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 138;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
            var cell = UITableViewCell();
            let text = styles[indexPath.row];
            
            var image : UIImage = UIImage(named: stylesImgs[indexPath.row])!;
            var imageView = UIImageView(image: image);
            imageView.frame = CGRect(x: (tableStyles.bounds.size.width/2) - (316/2), y: 5, width: image.size.width/3, height: image.size.height/3);
            
            cell.addSubview(imageView);
            
            return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRow = styles[indexPath.row];
        self.performSegueWithIdentifier("StyleViewController", sender:self)
        return;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var styleViewController = (segue.destinationViewController as StyleViewController);
        styleViewController.value = selectedRow;
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
