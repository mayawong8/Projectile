//
//  main.swift
//  assignment3
//
//  Created by Maya Wong on 2020-03-19.
//  Copyright © 2020 COMP1601. All rights reserved.
//

import Foundation

class input{
        var initalHeight: Float = 0
        var initalAngle: Float = 0
        var initalVelocity: Float = 0
        var numOfDivisons: Float = 0
        var time: Float = 0
        var check: Bool = true
    
    func getinitalHeight()-> Float{
        return initalHeight
    }
    func getinitalAngle()-> Float{
        return initalAngle
    }
    func getinitalVelocity()-> Float{
        return initalVelocity
    }
    func askUser()->Bool{
        //when function is called again reset variables to 0
        if (loop==true){
            initalHeight = 0
            initalAngle = 0
            initalVelocity = 0
            numOfDivisons = 0
            time = 0.00
        }
        //ask user for heigh, angle, velocity, and number of divisons
        print("Please enter inital height in meters: \n(type quit to exit) ")
        let num1 = readLine()
        if (num1=="quit"){
            check = false
            return check
        }
        print("Please enter inital angle in degrees ")
        let num2 = readLine()
        print("Please enter inital velocity in meters per second ")
        let num3 = readLine();
        print("Please enter number of divisons per second ")
        let num4 = readLine();
        
        //changing string input to float
        initalHeight = (num1 as! NSString).floatValue
        initalAngle = (num2 as! NSString).floatValue
        initalVelocity = (num3 as! NSString).floatValue
        numOfDivisons = (num4 as! NSString).floatValue
        
        //number of divions
        numOfDivisons = 1.00/numOfDivisons
        
       return check
    }
    
    func calculation(){
        //print titles
        print(" Theoretical                          Eulers ")
        print("TIME   Horizontal   Vertical    Horizontal  Vertical")
        //set Projectile variables to input values
        let test:Projectile=Projectile()
        test.iHeight = initalHeight
        test.iVelocity = initalVelocity
        test.iAngle = initalAngle
        //stop when vertical height is less than 0
        while (test.vPosition>=0){
            test.theoreticalMath(time: time)
            time+=numOfDivisons
        }
    }
}
var loop: Bool = false
let start = input()
//keep asking user for information and do calculations is loop equals true
     while (start.askUser()==true){
        loop = true
        start.calculation()
     }
