//
//  LoveViewController.swift
//  Draw
//
//  Created by Nikolay Shubenkov on 15/02/16.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class LoveViewController: UIViewController {

    var k = 5
    var emitterLayer:CAEmitterLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLoveLayer()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        emitterLayer?.beginTime = CACurrentMediaTime()
        emitterLayer?.lifetime  = 1
        
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        emitterLayer?.emitterPosition = touches.first!.locationInView(view)
        
        emitterLayer?.renderMode = kCAEmitterLayerAdditive
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        emitterLayer?.lifetime = 0
    }
    
    
    
    
    func createLoveLayer() {
        
        let layer = CAEmitterLayer()
        
        layer.frame = view.bounds
        
        layer.emitterPosition = view.center
        layer.emitterShape    = "shpere"
        layer.emitterSize     = CGSizeMake(50, 50)
        
        //часица
        let cell = CAEmitterCell()
        
        cell.birthRate = 15
        cell.lifetime  = 15
        
        cell.contents  = UIImage(named: "heart")!.CGImage
        
        cell.yAcceleration = 100
        
        cell.velocity = 100
        cell.emissionRange = CGFloat(M_PI * 2)
//        cell.emissionLatitude
  
        cell.spinRange = 5
        cell.spin  = 0
        
        cell.scale = 0.1
        
        layer.emitterCells = [cell]
        
        emitterLayer = layer
        
        layer.lifetime = 0
        
        self.view.layer.addSublayer(layer)
        
        
    }
    
    
    

}
