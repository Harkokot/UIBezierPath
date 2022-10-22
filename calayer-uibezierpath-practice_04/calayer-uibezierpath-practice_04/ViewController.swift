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
        let height: CGFloat = 353.0
        let square = SimpleCustomBorderAndShadowView(frame: CGRect(x: self.view.frame.width/2 - width/2,
                                                        y: self.view.frame.height/2 - height/2,
                                                        width: width,
                                                        height: height
                                                        ))
        self.view.addSubview(square)
    }
}
