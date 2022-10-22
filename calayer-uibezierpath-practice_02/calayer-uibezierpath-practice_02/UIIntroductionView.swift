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

    func createRectangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        path.close()
    }

    override func draw(_ rect: CGRect) {
        self.createRectangle()
        UIColor.orange.setFill()
        path.fill()
        UIColor.purple.setStroke()
        path.lineWidth = 10
        path.stroke()
    }
}
