//
//  SecondViewController.swift
//  CofficionadoTabbed
//
//  Created by Matt Oguz on 2/27/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableCountries: UITableView!
    
    let tableContent = [
        
        "Brazil",
        "Sumatra",
        "Nicaragua",
        "Mexico",
        "Colombia",
        "Peru",
        "Hawaii",
        "Guatemala",
        "Kenya",
        "Ethiopia",
        "Yemen"
        
    ];
    
    
    
    var selectedRow = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SET BACKGROUND
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!);
        
        tableCountries.delegate = self;
        tableCountries.dataSource = self;
        
       
        //Adding top bar button on navigation bar
        self.customiseNavigationBar()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
            var cell = UITableViewCell();
            let text = tableContent[indexPath.row];
            selectedRow = text;
            
           cell.textLabel?.text = text;
            cell.textLabel?.font = UIFont (name: "Gill Sans", size: 20)
            cell.textLabel?.textColor = UIColor.whiteColor();
            cell.backgroundColor = UIColor.clearColor();
            
            return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRow = tableContent[indexPath.row];
        self.performSegueWithIdentifier("CountryViewController", sender:self)
        return;
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var countryViewController = (segue.destinationViewController as CountryViewController);
        countryViewController.value = selectedRow;
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    
    
    /**
    This method add the button on navigation bar (Share and Favourite)
    */
    
    func customiseNavigationBar()
    {
        //Design for favourite button
        let starButton   = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        starButton.frame = CGRectMake(0, 0, 23, 23)
        starButton.backgroundColor = UIColor.clearColor()
        starButton.setImage(UIImage(named: "fav.png"), forState: UIControlState.Normal)
        starButton.addTarget(self, action: "favouriteButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        //Design for share button
        let shareButton   = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        shareButton.frame = CGRectMake(0, 0, 23, 23)
        shareButton.backgroundColor = UIColor.clearColor()
        shareButton.setImage(UIImage(named: "share.png"), forState: UIControlState.Normal)
        shareButton.addTarget(self, action: "shareButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        //Design for back button
        let backButton   = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        backButton.frame = CGRectMake(0, 0, 23, 23)
        backButton.backgroundColor = UIColor.clearColor()
        backButton.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        backButton.addTarget(self, action: "backButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        var shareBarButton = UIBarButtonItem(customView: shareButton)
        var backBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.titleView = starButton
        self.navigationItem.rightBarButtonItem = shareBarButton
        self.navigationItem.leftBarButtonItem = backBarButton
        
        
        let items = UINavigationItem();
        items.rightBarButtonItem = shareBarButton
       items.leftBarButtonItem = backBarButton
        self.navigationController?.navigationBar.setItems([items], animated: true)

        
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

