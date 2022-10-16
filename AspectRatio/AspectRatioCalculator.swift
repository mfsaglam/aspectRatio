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
    
    func calculate(width: Float?, height: Float?, format: RatioFormat) -> String? {
        guard width != nil && height != nil else { return nil }
        switch format {
            
        case .diagonal:
            let result = width! * width! + height! * height!
            return String(format: "%.2f", sqrt(result))
            
        case .oneBased:
            let result = width! / height!
            return String(format: "%.2f", result) + ":1"
            
        case .widthAndHeightBased:
            let gcd = gcd(width!, height!)
            return String(format: "%.0f", width! / gcd) + ":" + String(format: "%.0f", height! / gcd)
        }
    }
    
    private func gcd(_ a: Float, _ b: Float) -> Float {
        let r = a.truncatingRemainder(dividingBy: b)
        if r != 0 {
            return gcd(b, r)
        } else {
            return b
        }
    }
}
