//
//  InfoGraphicsViewController.swift
//  CofficionadoTabbed
//
//  Created by Shahrukh on 24/03/15.
//  Copyright (c) 2015 VentureScience. All rights reserved.
//

import UIKit

class InfoGraphicsViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - Variables
    var itemIndex: Int = 0
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = contentImageView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var scrollview: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView!.image = UIImage(named: imageName)
        scrollview.maximumZoomScale = 2.0;
        
        
        // Do any additional setup after loading the view.
        
        
    }
    
    
     override func viewDidAppear(animated: Bool) {
        //contentImageView.frame = CGRectMake(0, 0, scrollview.bounds.size.width, scrollview.bounds.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pinchZoomHandler(recognizer: UIPinchGestureRecognizer) {
        
        recognizer.view!.transform = CGAffineTransformScale(recognizer.view!.transform,
            recognizer.scale, recognizer.scale)
        recognizer.scale = 1
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
       return contentImageView
    }
    
    
    @IBAction func panZoomHandler(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        recognizer.view!.center = CGPoint(x:recognizer.view!.center.x + translation.x,
            y:recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }
    
    
    
    // MARK: - Top bar functions

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

    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

}
