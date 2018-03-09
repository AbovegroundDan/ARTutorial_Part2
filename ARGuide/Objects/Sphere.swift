//
//  Sphere.swift
//  ARWalkthrough
//
//  Created by Wyszynski, Daniel on 2/23/18.
//  Copyright © 2018 Nike, Inc. All rights reserved.
//

import Foundation
import SceneKit

class SceneObject: SCNNode {
 
    init(from file: String) {
        super.init()
        
        let nodesInFile = SCNNode.allNodes(from: file)
        nodesInFile.forEach { (node) in
            self.addChildNode(node)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Sphere: SceneObject {
    
    var animating: Bool = false
    let patrolDistance: Float = 4.85
    
    init() {
        super.init(from: "sphere.dae")        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate() {
        
        if animating { return }
        animating = true
        
        let rotateOne = SCNAction.rotateBy(x: 0, y: CGFloat(Float.random(min: -Float.pi, max: Float.pi)), z: 0, duration: 5.0)

        let backwards = rotateOne.reversed()
        let rotateSequence = SCNAction.sequence([rotateOne, backwards])
        let repeatForever = SCNAction.repeatForever(rotateSequence)

        runAction(repeatForever)
    }
    
    func patrol(targetPos: SCNVector3) {
        let distanceToTarget = targetPos.distance(receiver: self.position)
        
        if distanceToTarget < patrolDistance {
            removeAllActions()
            animating = false
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.20
            look(at: targetPos)
            SCNTransaction.commit()
        } else {
            if !animating {
                animate()
            }
        }
    }
}
