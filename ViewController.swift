//
//  ViewController.swift
//  Draw
//
//  Created by Nikolay Shubenkov on 11/02/16.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var smileView: SmileView!
    
    @IBAction func sliderValueChanged(slider: UISlider) {
        smileView.happiness = CGFloat(slider.value)
    }
    
    
}
