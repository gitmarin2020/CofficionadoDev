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
    
    
    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var countryDescription: UITextView!
 
   

    
    @IBOutlet weak var countryName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countryName.text = value;
        
        countryImage.image = UIImage(named: "Brazil");
        
        countryDescription.text = value;
        
        // SET BACKGROUND
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!);
        
        switch(value){
                   
        case "Brazil":
            countryDescription.text =
            "Coffee production in Brazil is responsible for about a third of all coffee, making Brazil by far the world's largest producer, a position the country has held for the last 150 years. Coffee plantations, covering some 27,000 km2 (10,000 sq mi), are mainly located in the southeastern states of Minas Gerais, São Paulo and Paraná where the environment and climate provide ideal growing conditions."
        case "Sumatra":
            countryDescription.text =
            "Sumatra coffees are famous for their peculiar flavor profile, low acidity, thick body, and rustic flavors that can often be described as earthy. Much of the flavor comes from the way Sumatras are processed, the wet-hull method , not to be confused with wet-processed coffee. The flavor of typical wet-hull Sumatra is polarizing among buyers. Some love it, but they must bracket this type of flavor profile because it would be considered unacceptable from any other origin besides Indonesia. Each coffee drinker has to discover if this type of flavor is right for them, or not; whether it's a go-to daily drinker, an occasional diversion, or flat-out unacceptable."
            
        case "Nicaragua":
            countryDescription.text =
                
            "Nicaraguan coffees have a wide range of flavor attributes. Some cup like Mexican coffees from Oaxaca, others have a more pronounced acidity. Some are mildly citrusy and bright, such as the coffees of Dipilto in Nueva Segovia department. The botanical cultivars utilized are traditional: Typica, some Bourbon and Maragogype dominate, along with Caturra and Pacas. There is some of the less desirable Catimor varietal, but many farms removed it after the catimor craze 10-20 years ago passed."
            
        case "Mexico":
            countryDescription.text =
                
            "Mexican coffee is classified by altitude, and much of the country’s coffee is used for blending and/or dark-roasted coffees. Coffee has been planted in Mexico since the late 1700s, and most of the country’s coffee now comes from the country’s southern region where the continent becomes narrower and bends to the east. On the gulf side of Mexico’s central mountain range is Veracruz State where most of the coffee is grown in the lowlands and is unremarkable. The nearby mountainous region, however, produces the respected Altura Coatepec named after the town of Coatepec and distinguished for its nutty flavor, light body, and a brightness with chocolaty overtones. Other respected coffees of Veracruz are Altura Huatusco, Altura Orizaba, and the most highly-respected, Altura Coatepec."
            
        case "Colombia":
            countryDescription.text =
                
            "For many Colombian coffee is the gold standard of fine gourmet coffees. Grown at high altitudes in rich volcanic soil, Colombian coffee is known for its great depth of flavor and smooth balance. Colombia has a large and thriving coffee industry. It is the second largest Arabica producer. Production is held to a very high quality standard. As a result many coffees are sold by special sorting methods. One developed for the European market is called Supremo. Europeans apparently have a fascination for looking at their beans. Americans by-pass that and go straight for taste. Sorted by size for the eye ball market the biggest beans are called Supremo. But big plump beans do not at all make for the best tasting cup of coffee. For this reason we seek out the melange blends of fine ripe cherries known as Excelso. This is where the taste is. So if taste is how you measure coffee and not appearance, do as I do: Drink Excelso. Our Colombian beans are characterized by a full medium dark roast flavor profile to bring out the sweet spot in fine Arabica. We are proud to offer this outstanding coffee from Colombia with its firm character, delicious aroma and satisfying finish. Recap: What's the difference between Colombian Supremo and Excelso? Answer: Supremos are fat. Excelsos are full of flavor."
            
        case "Peru":
            countryDescription.text =
                
            "Grown at exceptional altitudes, often above 1800 meters, mostly of the old Typica variety. This coffee is a clean, wet-processed coffee with striking acidic brightness, a clean cup, moderate fruit or floral hints, and good basic sweetness."
            
            
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
        self.navigationController?.navigationBarHidden = true;
    }
    
    
    
    @IBAction func orderButtonClickAction(sender: AnyObject) {
        
        self.performSegueWithIdentifier("COUNTRY-TO-WEBVIEW", sender: self);
    }
    
    
    @IBAction func backButtonAction(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var webViewController = (segue.destinationViewController as WebView);
        webViewController.countryName = value;
    }
    

}
