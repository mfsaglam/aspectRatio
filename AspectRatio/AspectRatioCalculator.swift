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
            return "0"
        case .oneBased:
            return "0:1"
        case .widthAndHeightBased:
            return "0:0"
        }
    }
}
