//
//  LayerViewController.swift
//  Draw
//
//  Created by Nikolay Shubenkov on 15/02/16.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class LayerViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTestView()
        // Do any additional setup after loading the view.
    }

    func setupTestView() {
        let layer = testView.layer
        
        layer.backgroundColor = UIColor.yellowColor().CGColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.purpleColor().colorWithAlphaComponent(0.7).CGColor
        layer.cornerRadius = 40
        layer.shadowColor  = UIColor.blueColor().CGColor
        
        layer.shadowOpacity = 1
        layer.shadowRadius  = 30
        layer.shadowOffset  = CGSizeMake(10, 10)
//        layer.shadowPath
        
        
        let subLablayer = CALayer()
        subLablayer.frame = CGRectMake(0, 0, 30, 50)
        subLablayer.backgroundColor = UIColor.orangeColor().CGColor
        
        layer.addSublayer(subLablayer)
        
        
        
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
