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
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }


}

