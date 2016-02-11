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
    
    @IBInspectable var noseColor:UIColor = UIColor.redColor()
    @IBInspectable var happiness:CGFloat = 1 {
        didSet {
            if happiness < -1 {
                happiness = -1
            }
            if happiness > 1 {
                happiness = 1
            }
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        
        drawBackground(rect)
        drawEyes(rect)
        drawNose(rect)
        drawMouth(rect)
    
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
        
        var betweenEyesPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        
        betweenEyesPoint.y -= CGRectGetHeight(rect) / 6.0
        
        let eyeShft = CGRectGetWidth(rect) / 5.5
        
        
        let leftEyePoint = CGPointMake(betweenEyesPoint.x - eyeShft
, betweenEyesPoint.y)
        let rightEyePoint = CGPointMake(betweenEyesPoint.x + eyeShft, betweenEyesPoint.y)
        
        drawEyeIn(leftEyePoint)
        drawEyeIn(rightEyePoint)
        
    }
    
    func drawEyeIn(point:CGPoint){
        let eyeSize = CGRectGetWidth(bounds) / 12
        
        conturLineColor.setStroke()
        UIColor.whiteColor().setFill()
        
        let eyePath = UIBezierPath(arcCenter: point,
            radius: eyeSize,
            startAngle: 0,
            endAngle: CGFloat(2.0 * M_PI ),
            clockwise: true)
        eyePath.lineWidth = conturLineWidth
        
        eyePath.fill()
        eyePath.stroke()
        
    }
    
    func drawNose(rect:CGRect){
        
        let path = UIBezierPath()
        
        let noseWidth = CGRectGetWidth(rect) / 10
        
        var noseStart = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        noseStart.y   = noseStart.y - noseWidth / 2
        
        var leftNosePoint = noseStart
        leftNosePoint.x = leftNosePoint.x - noseWidth / 2
        leftNosePoint.y = leftNosePoint.y + noseWidth
        
        var rightNosePoint = leftNosePoint
        rightNosePoint.x = rightNosePoint.x + noseWidth
        
        path.moveToPoint(noseStart)
        path.addLineToPoint(leftNosePoint)
        path.addLineToPoint(rightNosePoint)
        path.closePath()
        
        conturLineColor.setStroke()
        noseColor.setFill()
        
        path.lineWidth = conturLineWidth
        
        path.fill()
        path.stroke()
    }
    
    func drawMouth(rect:CGRect){
        
        var mouthSymetricPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        
        let mouthWidth = CGRectGetWidth(rect) / 4
        mouthSymetricPoint.y = mouthSymetricPoint.y + mouthWidth
        
        var leftPoint = mouthSymetricPoint
        leftPoint.x   = leftPoint.x - mouthWidth / 2
        
        var rightPoint = leftPoint
        rightPoint.x = rightPoint.x + mouthWidth
        
        
        var controlPoint = mouthSymetricPoint
        
        
        controlPoint.y = controlPoint.y + mouthWidth / 2 * happiness
        
        let path = UIBezierPath()
        
        path.lineWidth = conturLineWidth
        path.moveToPoint(leftPoint)
        path.addQuadCurveToPoint(rightPoint, controlPoint: controlPoint)
        path.closePath()
        
        UIColor.whiteColor().setFill()
        
        path.fill()
        path.stroke()
        
    }
    
}
