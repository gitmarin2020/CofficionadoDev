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
        "Papua New Guinea",
        "Brazil",
        "Sumatra",
        "Honduras",
        "Peru",
        "Guatemala",
        "Columbia"
    ];
    
    var selectedRow = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

