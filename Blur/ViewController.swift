//
//  ViewController.swift
//  Blur
//
//  Created by eyupcimen on 01/03/2017.
//  Copyright © 2017 eyupcimen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var addItemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    
    var effect : UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        addItemView.layer.cornerRadius = 5
    }

    
    func animateIn ()  {
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0 ;
        
        UIView.animate(withDuration: 0.4) { 
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut ()  {
        UIView.animate(withDuration: 0.3, animations: { 
            
            self.addItemView.transform  = CGAffineTransform.init(scaleX: 0.7 , y: 0.7)
            self.addItemView.alpha = 0
            self.visualEffectView.effect = nil
            
        }) { (success:Bool) in
            self.addItemView.removeFromSuperview()
        }
        
    }
 
    
    @IBAction func addBarButtonItem(_ sender: Any) {
        
        self.animateIn()
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        self.animateOut()
    }


}

