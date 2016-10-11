//
//  Calculate.swift
//  Where-am-i
//
//  Created by 임성훈 on 2016. 10. 6..
//  Copyright © 2016년 임성훈. All rights reserved.
//

import Foundation
struct Calculate{
    
   /* static func bearingP1toP2(p1Latitude: Double, p1Longitude: Double, p2Latitude: Double, p2Longitude: Double, cps: Float ) -> Int{
        let seta = getSeta(p1Latitude, p1Longitude, p2Latitude, p2Longitude)
        
        if(seta == cps) {
            return clockDir(seta)
        }
        else if(seta < cps) {
            return clockDir(seta - cps + 360)
        }
        else {
            return clockDir(seta - cps)
        }
    }*/
    
    static private func clockDir(seta: Double) -> Int{
        var result: Int = 0
        
        if(345 < seta || seta <= 15){
            result = 12
        }else if(15 < seta && seta <= 45){
            result = 1
        }else if(45 < seta && seta <= 75){
            result = 2
        }else if(75 < seta && seta <= 105){
            result = 3
        }else if(105 < seta && seta <= 135){
            result = 4
        }else if(135 < seta && seta <= 165){
            result = 5
        }else if(165 < seta && seta <= 195){
            result = 6
        }else if(195 < seta && seta <= 225){
            result = 7
        }else if(225 < seta && seta <= 255){
            result = 8
        }else if(255 < seta && seta <= 285){
            result = 9
        }else if(285 < seta && seta <= 315){
            result = 10
        }else if(315 < seta && seta <= 345){
            result = 11
        }
        
        return result;
    }
}
