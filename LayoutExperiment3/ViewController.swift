//
//  ViewController.swift
//  LayoutExperiment3
//
//  Created by Chaz on 9/13/19.
//  Copyright © 2019 Chaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView = UIImageView()
    
    var leadingConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    var topConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    var aspectWidthConstraint: NSLayoutConstraint?
    var aspectHeightConstraint: NSLayoutConstraint?
    
    @IBAction func sixteenNineButtonPressed(_ sender: Any) {
        aspectHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 0.5625, constant: 1)
        if(aspectHeightConstraint != nil){
        view.addConstraint(aspectHeightConstraint!)
        }
    }
    
    @IBAction func twoThreeButtonPressed(_ sender: Any) {
        aspectHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 0.75, constant: 1)
        if(aspectHeightConstraint != nil){
            view.addConstraint(aspectHeightConstraint!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Note: view is the same as self.view
        // The view is the container view that is the top level view for this view controller.
        
        imageView.image = UIImage(named: "ghibli.jpg")
        imageView.contentMode = .scaleToFill  // this tells the imageView how to display the image in it
            //Took me a while to figure out this is why I was unable to change the aspect ratio of the image lol
        imageView.clipsToBounds = true  // not really needed since doing scaleAspectFit, but be aware it exists
        view.addSubview(imageView) // this adds the imageView as a child of the View Controller's container view
        
        // why the following? https://stackoverflow.com/questions/47800210/when-should-translatesautoresizingmaskintoconstraints-be-set-to-true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //setting this to true made the image disappear
        
        

       leadingConstraint = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20.0)
        
        trailingConstraint = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20.0)
        
       topConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 200.0)
        
       bottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -20.0)
        
        aspectWidthConstraint = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 1)
        //this one actually works lol
        
          aspectHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 0.75, constant: 1)
        //Was attempting to be able to switch between 16:9 and 4:3 aspect ratios with the ui buttons
        //4:3 by default
        
//        leadingConstraint?.isActive = true
//        trailingConstraint?.isActive = true
//        topConstraint?.isActive = true
//        bottomConstraint?.isActive = true
        
        aspectWidthConstraint?.isActive = true
        aspectHeightConstraint?.isActive = true
        
        imageView.center.x = self.view.center.x
        imageView.center.y = self.view.center.y
        imageView.center = view.center
        /*
         Seems like this doesn't do anything?
         I'm sure I'm just implementing it wrong
         https://philandrews.io/post/swift-aligning-objects-programmatically
         */
        
        
    }
}

