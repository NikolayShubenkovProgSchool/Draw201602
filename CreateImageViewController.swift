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

        for _ in 0...5 {
            
            let angle:CGFloat = CGFloat(M_PI * 2.0 / 6.0)
            
            drawRadialGradientOfSize(imageView.frame.size, context: context)
            
            CGContextRotateCTM(context, angle)
//            CGContextScaleCTM(context, 0.9, 0.8)
            
        }

        
        drawRadialGradientOfSize(imageView.frame.size, context: context)
        
        
        crossTheHoleImageOfSize(imageView.frame.size)
        
        
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
    
    
    func drawRadialGradientOfSize(size:CGSize,context:CGContextRef){
        
        CGContextSaveGState(context)
        
        let clipPath = UIBezierPath(roundedRect: CGRectMake(40, 40, size.width/2, size.width/1.5), byRoundingCorners: [.BottomLeft,.TopLeft], cornerRadii:CGSizeMake(10, 10))
        
        clipPath.addClip()
        
        let colors = [
            UIColor.blackColor().CGColor,
            UIColor.whiteColor().CGColor,
            UIColor.purpleColor().CGColor,
            UIColor.greenColor().CGColor
        ]
        
        let positions:[CGFloat]  = [0.2, 0.4, 0.6, 0.9]
        let startPoint = CGPointMake(40, 40)
        let finishPoint = CGPointMake(60, 60)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let gradient = CGGradientCreateWithColors(colorSpace, colors, positions)
        
        CGContextDrawRadialGradient(context, gradient, startPoint, 80, finishPoint, 10, [])
        
        CGContextRestoreGState(context)
    }

    func crossTheHoleImageOfSize(size:CGSize){
        
        let crossPath = UIBezierPath()
        
        crossPath.moveToPoint(CGPointMake(0, 0))
        crossPath.addLineToPoint(CGPointMake(size.width, size.height))
        crossPath.moveToPoint(CGPointMake(size.width, 0))
        crossPath.addLineToPoint(CGPointMake(0, size.height))
        
        crossPath.lineWidth = 3
        
        UIColor.blackColor().setStroke()
        
        crossPath.stroke()
        
    }
    
    
    
    
    
    
    
    
    
    
}
