//
//  UtilityExtensions.swift
//  ARWalkthrough
//
//  Created by Wyszynski, Daniel on 3/8/18.
//  Copyright © 2018 Nike, Inc. All rights reserved.
//

import Foundation

public extension Float {
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    static var random: Float {
        get {
            return Float(arc4random()) / 0xFFFFFFFF
        }
    }
    /**
     Create a random num Float
     
     - parameter min: Float
     - parameter max: Float
     
     - returns: Float
     */
    public static func random(min: Float, max: Float) -> Float {
        return Float.random * (max - min) + min
    }
}
