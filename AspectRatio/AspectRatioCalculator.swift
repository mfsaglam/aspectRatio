//
//  AspectRatioCalculator.swift
//  AspectRatio
//
//  Created by Fatih Sağlam on 16.10.2022.
//

import Foundation

enum RatioFormat {
    case diagonal
    case oneBased
    case widthAndHeightBased
}

struct AspectRatioCalculator {
    
    func calculate(width: Float, height: Float, format: RatioFormat) -> String {
        switch format {
            
        case .diagonal:
            let result = width * width + height * height
            return String(format: "%.2f", sqrt(result))
            
        case .oneBased:
            let result = width / height
            return String(format: "%.2f", result) + ":1"
            
        case .widthAndHeightBased:
            let gcd = gcdIterativeEuklid(width, height)
            return String(format: "%.0f", width / gcd) + ":" + String(format: "%.0f", height / gcd)
        }
    }
    
    func gcdIterativeEuklid(_ m: Float, _ n: Float) -> Float {
        var a: Float = 0
        var b: Float = max(m, n)
        var r: Float = min(m, n)

        while r != 0 {
            a = b
            b = r
            r = a.truncatingRemainder(dividingBy: b)
//            r = a % b
        }
        return b
    }
    
    private func gcd(_ a: Float, _ b: Float) -> Float {
        let r = a.truncatingRemainder(dividingBy: b)
        if r > 10 {
            return gcd(b, r)
        } else {
            return b
        }
    }
}
