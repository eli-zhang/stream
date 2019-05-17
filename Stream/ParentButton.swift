//
//  ParentButton.swift
//  Stream
//
//  Created by Eli Zhang on 5/15/19.
//  Copyright © 2019 Eli Zhang. All rights reserved.
//

import UIKit

// Custom implementation based on Ramotion's CircleMenu
class ParentButton: UIButton {
    var childrenButtons: [UIButton]
    var childRadius: Float
    var startAngle: Float
    var endAngle: Float
    var childrenTag: Int
    var expanded: Bool = false
    
    public init(frame: CGRect, buttons: [UIButton], childRadius: Float, startAngle: Float, endAngle: Float, childrenTag: Int) {
        self.childrenButtons = buttons
        self.childRadius = childRadius
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.childrenTag = childrenTag
        super.init(frame: frame)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    convenience init(frame: CGRect, buttons: [UIButton], childRadius: Float, childrenTag: Int) {
        self.init(frame: frame, buttons: buttons, childRadius: childRadius, startAngle: 0, endAngle: 360, childrenTag: childrenTag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        if !expanded {
            showChildren()
        }
        else {
            hideChildren()
        }
    }
    
    func showChildren() {
        for i in 0..<childrenButtons.count {
            let button = childrenButtons[i]
            button.tag = childrenTag
            // The following animation fades the button in and increases size
            self.superview?.addSubview(button)
            button.snp.remakeConstraints { make in
                make.center.equalTo(self)
                make.width.height.equalTo(self.childRadius * 2)
            }
        
            button.transform = CGAffineTransform(scaleX: 0, y: 0) // Makes size 0 before animating
            button.alpha = 0
            button.superview?.setNeedsUpdateConstraints()
            button.superview?.layoutIfNeeded()
            
            UIView.animate(
                withDuration: 0.5,
                delay: TimeInterval(Float(i) * 0.1),
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseOut,
                animations: {
                    button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    button.alpha = 1},
                completion: { finished in })
            
            let range = self.endAngle - self.startAngle
            let angle = self.startAngle + range / (range < 360 ? Float(childrenButtons.count - 1) : Float(childrenButtons.count)) * Float(i)
            let distance: Float = self.childRadius * 8 / 3
            
            let offsets = components(angle: angle, distance: distance)
            let xOffset = offsets.0
            let yOffset = offsets.1
            button.snp.remakeConstraints { make in
                make.centerX.equalTo(self).offset(xOffset)
                make.centerY.equalTo(self).offset(yOffset)
                make.width.height.equalTo(self.childRadius * 2)
            }
            UIView.animate(
                withDuration: 0.8,
                delay: TimeInterval(Float(i) * 0.1),
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseOut,
                animations: {
                    button.superview?.layoutIfNeeded()},
                completion: { finished in
                self.expanded = true
            })
        }
    }
    
    func hideChildren() {
        for i in 0..<childrenButtons.count {
            let button = childrenButtons[i]
            
            UIView.animate(
                withDuration: 0.5,
                delay: TimeInterval(Float(i) * 0.1),
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseOut,
                animations: {
                    button.alpha = 0},
                completion: { finished in })

            button.snp.remakeConstraints { make in
                make.centerX.equalTo(self)
                make.centerY.equalTo(self)
            }
            button.superview?.setNeedsUpdateConstraints()
            
            UIView.animate(
                withDuration: 0.8,
                delay: TimeInterval(Float(i) * 0.1),
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseOut,
                animations: {
                    button.superview?.layoutIfNeeded()},
                completion: { finished in
                self.expanded = false
                self.removeChildrenFromSuperview()
            })
        }
    }
    
    func removeChildrenFromSuperview() {
//        for subview in self.superview!.subviews {
//            if subview.tag == childrenTag {
//                subview.removeFromSuperview()
//            }
//        }
    }
    
    fileprivate func components(angle: Float, distance: Float) -> (Float, Float) {
        let xComponent = cos(angle * .pi / 180) * distance
        let yComponent = sin(angle * .pi / 180) * distance
        return (xComponent, yComponent)
    }
}
