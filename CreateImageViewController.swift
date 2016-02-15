//
//  CreateImageViewController.swift
//  Draw
//
//  Created by Nikolay Shubenkov on 15/02/16.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class CreateImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imageView.image = createImage()
        
    }
    
    
    func createImage()->UIImage {
        
        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()!
        
        drawGradientOfSize(imageView.frame.size, context: context)
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    func drawGradientOfSize(size:CGSize, context:CGContextRef){
        
        
        let colors = [
            UIColor.redColor().CGColor,
            UIColor.orangeColor().CGColor,
            UIColor.yellowColor().CGColor,
            UIColor.greenColor().CGColor
        ]
        
        let positions:[CGFloat]  = [0.2, 0.4, 0.6, 0.9]
        let startPoint = CGPointMake(10, 10)
        let finishPoint = CGPointMake(size.width, size.height)
        
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let gradient = CGGradientCreateWithColors(colorSpace, colors, positions)
        
        CGContextDrawLinearGradient(context,
            gradient, startPoint, finishPoint, [])
        
        
    }
    
    
    
}
