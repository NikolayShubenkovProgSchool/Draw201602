//
//  SmileView.swift
//  Draw
//
//  Created by Nikolay Shubenkov on 11/02/16.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

@IBDesignable
class SmileView: UIView {

    @IBInspectable var smileBackgroundColor:UIColor = UIColor.yellowColor(){
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var conturLineColor:UIColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var conturLineWidth:CGFloat = 2 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override func drawRect(rect: CGRect) {
        
        drawBackground(rect)
        drawEyes(rect)
    
    }
    
    func drawBackground(rect:CGRect){
        
        let backgroundRect = CGRectInset(rect, conturLineWidth/2, conturLineWidth/2)
        
        let backgroundPath = UIBezierPath(ovalInRect: backgroundRect)
        backgroundPath.lineWidth = conturLineWidth
        
        
        conturLineColor.setStroke()
        smileBackgroundColor.setFill()
        
        backgroundPath.fill()
        backgroundPath.stroke()
        
    }

    func drawEyes(rect:CGRect) {
        
    }
    
    
}
