//
//  UIIntroductionView.swift
//  calayer-uibezierpath-practice
//
//  Created by Никита Лисунов on 05.10.2022.
//

import UIKit

class UIIntroductionView: UIView {
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemGray
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//  STAR VIEW
    override func draw(_ rect: CGRect) {
        let padding: CGFloat = 40
        let pathRect = CGRect(
            x: padding, y: padding,
            width: rect.width - padding * 2,
            height: rect.width - padding * 2
        )
        let path = self.starIn(rect: pathRect)
        UIColor.yellow.setFill()
        path.fill()
    }

    private func starIn(rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let center = CGPoint(
            x: rect.origin.x + rect.width / 2.0,
            y: rect.origin.y + rect.height / 2.0
        )
        let pointsOnStar = 5
        var angle: CGFloat = CGFloat(CGFloat.pi / 2.0)
        let angleIncrement = CGFloat(Double.pi * 2.0 / Double(pointsOnStar))
        let radius: CGFloat = rect.width / 2.0
        let midRadius: CGFloat = 0.45 * radius
        var firstPoint = true

        for _ in 1...pointsOnStar {
            let point = pointFrom(angle: angle, radius: midRadius, offset: center)
            let nextPoint = pointFrom(angle: angle + angleIncrement, radius: midRadius, offset: center)
            let midPoint = pointFrom(angle: angle + angleIncrement / 2.0, radius: radius, offset: center)
            if firstPoint {
                firstPoint = false
                path.move(to: point)
            }
            path.addLine(to: midPoint)
            path.addLine(to: nextPoint)
            angle += angleIncrement
        }
        path.close()

        return path
    }

    private func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        let x = radius * cos(angle) + offset.x
        let y = radius * sin(angle) + offset.y

        return CGPoint(x: x, y: y)
    }
}
