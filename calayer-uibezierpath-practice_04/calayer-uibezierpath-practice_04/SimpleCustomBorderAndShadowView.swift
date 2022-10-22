//
//  SimpleCustomBorderAndShadowView.swift
//  calayer-uibezierpath-practice
//
//  Created by Никита Лисунов on 07.10.2022.
//

import UIKit

final class SimpleCustomBorderAndShadowView: UIView {
    private let frontLayer = CALayer()
    private let inset: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frontLayer.frame = bounds
        let maskAndShadowPath = UIBezierPath()
        maskAndShadowPath.move(to: CGPoint(x: 0, y: inset))
        maskAndShadowPath.addLine(to: CGPoint(x: inset, y: 0))
        maskAndShadowPath.addLine(to: CGPoint(x: bounds.width - inset, y: 0))
        maskAndShadowPath.addArc(withCenter: CGPoint(x: bounds.width - inset, y: inset), radius: inset, startAngle: -CGFloat.pi / 2, endAngle: 0, clockwise: true)
        maskAndShadowPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height - inset))
        maskAndShadowPath.addLine(to: CGPoint(x: bounds.width - inset, y: bounds.height))
        maskAndShadowPath.addLine(to: CGPoint(x: inset, y: bounds.height))
        maskAndShadowPath.addArc(withCenter: CGPoint(x: inset, y: bounds.height - inset), radius: inset, startAngle: CGFloat.pi / 2, endAngle: CGFloat.pi, clockwise: true)
        maskAndShadowPath.close()
        (frontLayer.mask as? CAShapeLayer)?.frame = bounds
        (frontLayer.mask as? CAShapeLayer)?.path = maskAndShadowPath.cgPath
        layer.shadowPath = maskAndShadowPath.cgPath
    }
    
    private func setup() {
        backgroundColor = .clear
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 20
        layer.shadowOpacity = 1
        frontLayer.mask = CAShapeLayer()
        frontLayer.backgroundColor = UIColor.white.cgColor
        layer.addSublayer(frontLayer)
    }
}
