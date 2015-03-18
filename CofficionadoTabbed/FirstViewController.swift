//
//  FirstViewController.swift
//  CofficionadoTabbed
//
//  Created by Matt Oguz on 2/27/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        
        self.customiseNavigationBar()
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
    }

    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }


}

