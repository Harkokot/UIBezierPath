//
//  ViewController.swift
//  calayer-uibezierpath-practice
//
//  Created by Никита Лисунов on 05.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creation of View via UIBezierPath
        let width: CGFloat = 353.0
        let height: CGFloat = 200.0
        let square = UIIntroductionView(frame: CGRect(x: self.view.frame.width/2 - width/2,
                                                        y: self.view.frame.height/2 - height/2,
                                                        width: width,
                                                        height: height
                                                        ))
        square.layer.cornerRadius = 5
        square.layer.masksToBounds = true
        self.view.addSubview(square)

        let globalDuration: CFTimeInterval = 5.0
        let globalRepeatCount: Float = 25.0

        // CornerRadius Animation
        let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        cornerAnimation.fromValue = 0.0
        cornerAnimation.toValue = 20.0
        cornerAnimation.duration = globalDuration
        cornerAnimation.repeatCount = globalRepeatCount
        cornerAnimation.autoreverses = true

        // Position Animation
        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.fromValue = CGPoint(x: 73, y: 100)
        positionAnimation.toValue = CGPoint(x: 280, y: 100)
        positionAnimation.duration = globalDuration
        positionAnimation.repeatCount = globalRepeatCount
        positionAnimation.autoreverses = true

        // Background Animation
        let backgroundAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        backgroundAnimation.fromValue = UIColor.blue.cgColor
        backgroundAnimation.toValue = UIColor.green.cgColor
        backgroundAnimation.duration = globalDuration
        backgroundAnimation.repeatCount = globalRepeatCount
        backgroundAnimation.autoreverses = true

        // Bounds Animation
        let boundsAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.bounds))
        boundsAnimation.fromValue = CGRect(x: 0, y: 0, width: 20, height: 20)
        boundsAnimation.toValue = CGRect(x: 0, y: 0, width: 40, height: 80)
        boundsAnimation.duration = globalDuration
        boundsAnimation.repeatCount = globalRepeatCount
        boundsAnimation.autoreverses = true

        // Creation of Sublayer
        let newSublayer = CALayer()
        newSublayer.frame = CGRect(x: 80, y: 80, width: 40, height: 40)
        newSublayer.backgroundColor = UIColor.green.cgColor
        square.layer.addSublayer(newSublayer)

        // Apply all animations to sublayer
        CATransaction.begin()
        newSublayer.add(positionAnimation, forKey: #keyPath(CALayer.position))
        newSublayer.add(cornerAnimation, forKey: #keyPath(CALayer.cornerRadius))
        newSublayer.add(backgroundAnimation, forKey: #keyPath(CALayer.backgroundColor))
        newSublayer.add(boundsAnimation, forKey: #keyPath(CALayer.bounds))
        CATransaction.commit()
    }
}
