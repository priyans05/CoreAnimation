//
//  AnimationHelper.swift
//  CoreAnimation
//
//  Created by PRIYANS on 1/4/19.
//  Copyright © 2019 PRIYANS. All rights reserved.
//

import UIKit

class AnimationHelper {
    // MARK: Animatable Properties
    static var opacity = "opacity"
    static var posY = "position.y"
    
    // MARK: Common Animations
    static func basicFadeAnimation() -> CABasicAnimation {
        let fadeIn = CABasicAnimation(keyPath: opacity)
        
        fadeIn.fromValue = 0.0
        fadeIn.toValue = 1.0
        fadeIn.duration = 1.0
        fadeIn.fillMode = CAMediaTimingFillMode.backwards
        
        return fadeIn
    }
    
    // MARK: Utilities
    static var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    static func addDelay(time: Double) -> CFTimeInterval {
        return CACurrentMediaTime() + time
    }
    
    // MARK: Shapes
    
    static func squareShapeLayer() -> CAShapeLayer {
        let square = CAShapeLayer()
        let rect = CGRect(x: screenBounds.midX - 100, y: screenBounds.midY - 100, width: 200, height: 200)
        let bazPath = UIBezierPath(rect: rect)
        square.path = bazPath.cgPath
        square.fillColor = UIColor.clear.cgColor
        square.strokeColor = UIColor.white.cgColor
        square.lineWidth = 5.0
        square.lineDashPattern = [20,5]
        
        return square
    }
    
    static func circleShapeLayer() -> CAShapeLayer {
        let circle = CAShapeLayer()
        let rect = CGRect(x: -50, y: -50, width: 100, height: 100)
        let bazPath = UIBezierPath(roundedRect: rect, cornerRadius: 100)
        circle.path = bazPath.cgPath
        circle.fillColor = UIColor.white.cgColor
        circle.strokeColor = UIColor.yellow.cgColor
        circle.lineWidth = 3.0
        
        return circle
    }
    
    static func triangleShapeLayer() -> CAShapeLayer {
        let triangle = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 40.0, y: 60.0))
        path.addLine(to: CGPoint(x: 120.0, y: -40.0))
        path.addLine(to: CGPoint(x: -40.0, y: -40.0))
        
        triangle.path = path
        triangle.fillColor = UIColor.white.cgColor
        return triangle
    }
}
