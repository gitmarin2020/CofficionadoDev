//
//  CountryViewController.swift
//  CofficionadoTabbed
//
//  Created by Raphzz on 3/4/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {

    var value:String!
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var countryDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryName.text = value;

        countryImage.image = UIImage(named: value);
        
        switch(value){
            case "Brazil":
                break;
            default:
                break;
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false;
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
