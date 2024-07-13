//
//  AccountQRViewModel.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/03.
//

import CoreMotion
import CoreGraphics
import CoreImage.CIFilterBuiltins
import SwiftUI

class KiraKiraViewModel: ObservableObject {
    @Published var middleImageOpacity: CGFloat = 1
    @Published var frontImageOpacitry: CGFloat = 0
    
    private let motionManager = CMMotionManager()
    private let baseDegrees: CGFloat = 40
    
    init() {
        if motionManager.isDeviceMotionAvailable {
            startUpdatingLenticulation()
        }
    }
    
    private func startUpdatingLenticulation() {
        motionManager.deviceMotionUpdateInterval = 1.0 / 80.0
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) { (deviceMotion, error) in
            guard let deviceMotion = deviceMotion,
                  error == nil
            else { return }
            
            let degree = deviceMotion.attitude.roll.convertedRadianToDegree()
            let attitudeState = DeviceAttitudeState(degree)
            self.updateImageOpacity(with: attitudeState)
        }
    }
    
    private func updateImageOpacity(with attributeState: DeviceAttitudeState) {
        
        switch attributeState {
        case .flat:
            update(middleImageOpacity: 1, andFrontImageOpacity: 0)
        case .forward(let degree):
            let frontOpacity = degree >= baseDegrees ?  1 : degree / baseDegrees
            update(middleImageOpacity: 1, andFrontImageOpacity: frontOpacity)
        case .backward(let degree):
            let middleOpacity = degree >= baseDegrees ?  0 : (baseDegrees - degree) / baseDegrees
            update(middleImageOpacity: middleOpacity, andFrontImageOpacity: 0)
        }
    }
    
    private func update(middleImageOpacity: CGFloat,
                        andFrontImageOpacity frontImageOpacty: CGFloat) {
        self.middleImageOpacity = middleImageOpacity
        self.frontImageOpacitry = frontImageOpacty
    }
}

extension Double {
    func convertedRadianToDegree() -> Double {
        return self * 180 / Double.pi
    }
}

extension KiraKiraViewModel {
    enum DeviceAttitudeState {
        case flat
        case forward(degree: Double)
        case backward(degree: Double)
        
        init(_ degree: Double) {
            
            switch degree {
            case 1...180:
                self = .forward(degree: degree)
            case -180 ... -1:
                let positiveDegree = degree * -1
                self = .forward(degree: positiveDegree)
            default:
                self = .flat
            }
        }
    }
}
