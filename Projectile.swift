//
//  Projectile.swift
//  assignment3
//
//  Created by Maya Wong on 2020-03-20.
//  Copyright © 2020 COMP1601. All rights reserved.
//

import Foundation

class Projectile{
    var time: Float = 0
    var verticalAcceleration: Float = -9.81
    var hPosition: Float = 0
    var vPosition: Float = 0
    var iVelocity: Float = 0
    var iHeight: Float = 0
    var iAngle: Float = 0
    var previousVX: Float = 0
    var previousVY: Float = 0
    var currentVX: Float = 0
    var currentVY: Float = 0
    var previousT: Float = 0
    var previousX: Float = 0
    var previousY: Float = 0
    var currentX: Float = 0
    var currentY: Float = 0
    
//does math
    func theoreticalMath(time: Float){
        //horizontal and vertical displacement
        hPosition = Float((iVelocity*(cos(iAngle * 0.01745329))) * time)
        vPosition = Float((verticalAcceleration * (time * time))/2) + Float(((iVelocity*(sin(iAngle * 0.01745329))) * time) + (iHeight))

        //horizontal and vertical eulers numbers
        if (time==0.00){
            currentX = 0
            currentY = iHeight
            previousX = 0
            previousY = iHeight
            previousVX = Float((iVelocity*(cos(iAngle * 0.01745329))))
            previousVY = Float(((iVelocity*(sin(iAngle * 0.01745329)))))
            currentVY = previousVY
            currentVX = previousVX
            previousT = time
        }
        else{
        currentVX = previousVX
        currentVY = previousVY + (verticalAcceleration * (deltaTime(time1: time,time2: previousT)))
        currentX = previousX + (currentVX * (deltaTime(time1: time, time2: previousT)))
        currentY = previousY + (currentVY * (deltaTime(time1: time, time2: previousT)))
        previousT = time
        }
        //formatting outputs
        let output1 = String(format:"%.2f", time)
        let output2 = String(format:"%.2f", hPosition)
        let output3 = String(format:"%.2f", vPosition)
        let output4 = String(format:"%.2f", currentX)
        let output5 = String(format:"%.2f", currentY)
        
        if (vPosition>=0){
            print(" \(output1)      \(output2)    \(output3)|          \(output4)   \(output5)")
            previousVX = currentVX
            previousVY = currentVY
            previousY = currentY
            previousX = currentX
        }
    }
    func deltaTime(time1: Float, time2: Float)-> Float{
        return time1-time2
    }
}


