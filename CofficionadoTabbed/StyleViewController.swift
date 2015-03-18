//
//  StyleViewController.swift
//  CofficionadoTabbed
//
//  Created by Raphzz on 3/6/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class StyleViewController: UIViewController {

    var value:String!
    
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet var Link: UIButton!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var bestWith: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.text = value;
        
        // SET BACKGROUND
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!);
        
       //adding button on top bar
        self.customiseNavigationBar()
        
        
        switch(value){
            case "The Americano":
                descriptionText.text = "The first Americano coffee is thought to have come from the battlefield of World War II. American GIs in Europe tried to make a coffee similar to the one they were accustomed to by diluting it with hot water. Later on the coffee became popular in the US. An Americano coffee is a shot of Espresso coffee infused with hot water. The ratio of water to Espresso is 1:1 (equal amounts).  An Americano coffee is as intensive as drip coffee, but has a different flavour.";
                bestWith.text = "Brazilian Coffee"
                
               titleImage.image = UIImage(named: "americano_cup.jpeg");
                
                break;
            case "The Cappucinno":
                descriptionText.text = "Cappuccino is an Espresso based coffee drink prepared with exactly the same amount of Espresso, steamed milk and milk foam (1/3 of each). The origin of the word is said to be from the Capuchin friars (Order of Friars Minor Capuchin). Why? The Capuchin Friars wore brown habits (distinctive attire worn by a member of a religious order) and shaved the top part of their head leaving a surrounding ring of brown hair. Another origin of the word Cappuccino may be from the Italian equivalent for hood ‘Cappuccio’.";
                
                 titleImage.image = UIImage(named: "capuccino_cup.jpg");
                break;
            case "The Espresso":
                descriptionText.text = "The origin of the word (and the Espresso beverage itself) is from Italy. The word Espresso literally describes the feelings you experience after one sip: expression of flavour and aroma, pressed through the ground beans, expressly and freshly made just for you. Espresso coffee is usually very dark roasted coffee with a strong bitter-sweet taste, mild hazel-brown crema on top and distinctive aroma. The beans are roasted until they are dark and oily in appearance.";
                
                 titleImage.image = UIImage(named: "espresso_cup.jpg");
                break;
            case "The Flatwhite":
                descriptionText.text = "In the words of Australian actor Hugh Jackman, who owns a coffee shop in New York and personally trained staff to make the beverage, the flat white is “like a latte with a little less milk and more espresso”. But it’s actually a little more complicated (and pretentious) than that. Some say the name “flat white” was coined in the early 1980s in Sydney, Australia. But there are also arguments to suggest the drink was actually being made earlier in another Australian city, Melbourne, in the 1970s. New Zealanders, however, argue the drink was developed into its modern form in the coffee shops of the nation’s capital, Wellington, in the later 1980s. The safest answer is to say both countries helped forge the flat white’s identity and according to Australian food historian Michael Symons, Wellington-produced flat whites remain the best in the world.";
                titleImage.image = UIImage(named: "flat_white_cup.jpg");
                break;
            
            case "The Galao":
                descriptionText.text = "Galão is a hot drink from Portugal made of espresso and foamed milk. In all similar to café latte or café au lait, it comes in a tall glass with about one quarter coffee, three quarters foamed milk, as opposed to the smaller Garoto (coffee) that is served in a demitasse/espresso smaller china cup. When the proportion is 1:1 it is called 'meia de leite' (half of milk) and it comes in a cup. It can be said to be like a cortado but with a much larger amount of milk; the proportions are closer to a caffè latte.";
                
                 titleImage.image = UIImage(named: "portugal_galao_cup.jpg");
                
                break;
            case "The Icecoffee":
                descriptionText.text = "Iced coffee is a cold variant of coffee. The iced latte and iced mocha are examples. \n\nThere are various brewing methods, with the fundamental division being cold brew – brewing the coffee cold, yielding different flavor, but not requiring cooling – or brewing hot and then cooling, generally by simply pouring over ice or into ice cold milk. In case of hot brewing this can be normally brewed coffee (drip, press pot, etc.), or espresso. In case of hot brewing, sweeteners and flavorings are often mixed into the hot coffee before cooling, due to higher solubility in hot water. Alternatively, syrup (sugar pre-dissolved in water) may be used, particularly gum syrup. Pre-packaged iced coffee is available as a grocery item in several countries. Regardless of brewing method, iced coffee is generally brewed at a higher strength than normal coffee, due to the dilution caused by the ice.";
                titleImage.image = UIImage(named: "Iced-Coffee-cup.jpg");
                break;
            case "The Latte":
                descriptionText.text = "This is very popular drink in America probably due to its sweet, mellow flavor. One shot of espresso is mixed with 6 to 8 ounces of steamed milk, then topped with foam - if you prefer. Without the foam it’s officially known as a Flat White. Since it’s hard to find a latte in the super-sized United States smaller than 12 ounces, a double shot of espresso is common. If you prefer greater amperage via caffeine, up the number of shots! \n\nWith a few minor variations, this also goes by the name Café con Leche or Café Au Lait, depending on whether your coffee spirit is channeling Spanish or French.";
                titleImage.image = UIImage(named: "latte_cup.jpg");
                break;
            case "The Macchiato":
                descriptionText.text = "Caffè Macchiato (Espresso Macchiato) is usually a double or triple shot of Espresso with a dollop of dense milky foam placed on top to cover the Espresso.\nIn Italian, Macchiato literally means ‘marked’ or ‘stained (with)’. This coffee is ‘marked’ by a drop of milk, which differentiates Caffè Macchiato from dark Caffè Espresso.\nCaffè Machiato has two variants: Caffè Macchiato Freddo (with cold milk) and Caffè Macchiato Caldo (with hot milk). Freddo is good if you are in hurry or can’t wait until your coffee gets to a drinkable temperature.\nNote: Not to be confused with Latte Macchiato which is prepared by adding an Espresso to frothed and steamed milk. The milk and coffee parts make layers and smaller amounts of Espresso are used (compared to the Caffe Macchiato or Caffe Latte).\nNote: Starbucks’ Macchiato, has become very popular around the world. It was often referred to incorrectly, with real Italian Caffè Macchiato. Caramel Macchiato presented by Starbucks is a caramel form of Latte (not Macchiato).";
                titleImage.image = UIImage(named: "macchiato_cup.jpeg");
                break;
            case "The Melange":
                descriptionText.text = "A Melange is the typical Viennese coffee speciality. It is one small espresso served in a large cup with half steamed milk topped off with milk froth.";
                titleImage.image = UIImage(named: "melange_cup.jpg");
                break;
            case "The Tripplo":
                descriptionText.text = "Tripplo is only for people who really love coffee and withstand caffeine. As its name shows, the Tripplo is actually three shots of espresso and nothing else.";
                titleImage.image = UIImage(named: "tripplo_cup.jpg");
                break;
            case "The Viennese":
                descriptionText.text = "The Viennese coffeehouse is simply unique. When referring to the typical Viennese coffeehouse, there are a certain number of social practices and rituals that create a very specific atmosphere. Apart from a wide variety of coffees, pastries as well as international newspapers the Viennese coffeehouse is famous for its marble top tables, thonet chairs, newspaper holders and chandeliers.\n\nBut what does the Viennese coffeehouse exactly stand for apart from perfectly brewed coffee? \n\nWell, that is quite simple – it represents social life at its best. It is a place where all sorts of individuals meet to discuss their dreams, to reflect on their thoughts, to share their ideas, to compose masterpieces, to read or just to quietly sit and watch our colourful life happen. With one single cup of coffee, which traditionally comes served on a silver tray with a glass of water, one is entitled to linger in the coffeehouse for hours and hours, even without ordering anything else, making you feel at home. It is here, in this amazing institution full of history, emotions and life, where poetry comes to life.";
                titleImage.image = UIImage(named: "viennese_cup.jpg");
                break;
            
            default:
                break;
        }

        
        
       
        // Do any additional setup after loading the view.
    }

    
    @IBAction func orderBtnAction(sender: UIButton) {
        
//    self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("WebView") as WebViewViewController, animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sayHello(sender: UIBarButtonItem) {
        
        
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
