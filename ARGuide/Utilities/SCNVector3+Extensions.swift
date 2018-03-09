//
//  SCNVector3+Extensions.swift
//  ARWalkthrough
//
//  Created by Wyszynski, Daniel on 3/7/18.
//  Copyright © 2018 Nike, Inc. All rights reserved.
//

import Foundation
import SceneKit

extension SCNVector3 {
    public func distance(receiver:SCNVector3) -> Float {
        let xd = receiver.x - self.x
        let yd = receiver.y - self.y
        let zd = receiver.z - self.z
        let distance = Float(sqrt(xd * xd + yd * yd + zd * zd))
        
        if (distance < 0){
            return (distance * -1)
        } else {
            return (distance)
        }
    }
}
