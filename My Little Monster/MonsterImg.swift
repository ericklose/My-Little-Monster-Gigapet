//
//  MonsterImg.swift
//  My Little Monster
//
//  Created by Eric Klose on 2/15/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import Foundation
import UIKit


class MonsterImg: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation() {
        self.image = UIImage(named: "idle1.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for var x = 1; x <= 4; x++ {
            let img = UIImage(named: "idle\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
        
    }
    
    func playDeathAnimation() {
        
        self.image = UIImage(named: "dead5.png")
        
        self.animationImages = nil
        
        var deadArray = [UIImage]()
        for var x = 1; x <= 5; x++ {
            let img = UIImage(named: "dead\(x).png")
            deadArray.append(img!)
        }
        
        self.animationImages = deadArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
    func restartIdleAnimation(timer: NSTimer!) {
        playIdleAnimation()
    }
    
    func returnToLifeAnimation() {
        
        self.image = UIImage(named: "dead1.png")
        
        self.animationImages = nil
        
        var liveArray = [UIImage]()
        for var x = 5; x >= 1; x-- {
            let img = UIImage(named: "dead\(x).png")
            liveArray.append(img!)
        }
        
        self.animationImages = liveArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "restartIdleAnimation:", userInfo: nil, repeats: false)
        
    }
    
}

