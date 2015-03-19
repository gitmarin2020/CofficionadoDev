//
//  CoffeesViewController.swift
//  CofficionadoTabbed
//
//  Created by Shahrukh on 19/03/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class CoffeesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        self.navigationController?.navigationBarHidden = true
    }
    
    
    @IBAction func reviewButtonAction(sender: AnyObject) {
    }
    
    @IBAction func shareButtonAction(sender: AnyObject) {
    }
    /**
    This method add the button on navigation bar (Share and Favourite)
    */
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
