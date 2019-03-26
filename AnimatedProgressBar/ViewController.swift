//
//  ViewController.swift
//  AnimatedProgressBar
//
//  Created by Xavier Castro on 3/25/19.
//  Copyright © 2019 Xavier Castro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let shapeLayer = CAShapeLayer()
	let trackLayer = CAShapeLayer()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		let center = view.center

		let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)

		trackLayer.path = circularPath.cgPath
		trackLayer.strokeColor = UIColor.lightGray.cgColor
		trackLayer.fillColor = UIColor.clear.cgColor
		trackLayer.lineWidth = 10
		trackLayer.lineCap = .round
		view.layer.addSublayer(trackLayer)

		shapeLayer.path = circularPath.cgPath
		shapeLayer.strokeColor = UIColor.red.cgColor
		shapeLayer.fillColor = UIColor.clear.cgColor
		shapeLayer.lineWidth = 10
		shapeLayer.lineCap = .round
		shapeLayer.strokeEnd = 0

		view.layer.addSublayer(shapeLayer)

		view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
	}

	@objc private func handleTap() {
		let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
		basicAnimation.toValue = 1
		basicAnimation.duration = 2
		basicAnimation.fillMode = .forwards
		basicAnimation.isRemovedOnCompletion = false
		shapeLayer.add(basicAnimation, forKey: "basicId")
	}


}

