//
//  ViewController.swift
//  SwiftStripeDemo
//
//  Created by Ravi Shankar on 02/09/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, STPViewDelegate{
                            
    @IBOutlet var saveButton: UIButton!
    
    var stripeView: STPView = STPView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stripeView = STPView(frame: CGRectMake(15, 20, 290, 55), andKey: "pk_test_6pRNASCoBOKtIshFeQd4XMUh")
        stripeView.delegate = self
        view.addSubview(stripeView)
        saveButton.enabled = false
    }
    
    func stripeView(view: STPView!, withCard card: PKCard!, isValid valid: Bool) {
        if (valid) {
            saveButton.enabled = true
        } else {
            saveButton.enabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        stripeView.createToken { (stpToken, error) -> Void in
            if (error != nil) {
                println(error)
            } else {
                println(stpToken)
            }
        }
    }

}

