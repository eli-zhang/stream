//
//  RadialGradientView.swift
//  Stream
//
//  Created by Eli Zhang on 5/15/19.
//  Copyright © 2019 Eli Zhang. All rights reserved.
//

import UIKit

class RadialGradientView: UIView {
    
    let radius: CGFloat = 500
    let colors: [CGColor] = [UIColor(red: 22/255, green: 24/255, blue: 48/255, alpha: 1.0).cgColor, UIColor.black.cgColor]
    var gradientLayer: RadialGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientLayer = RadialGradientLayer(radius: radius, colors: colors)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if gradientLayer.superlayer == nil {
            layer.insertSublayer(gradientLayer, at: 0)
        }
        gradientLayer.frame = bounds
    }
}

class RadialGradientLayer: CALayer {
    
    var center: CGPoint {
        return CGPoint(x: bounds.width / 2, y: bounds.height / 2)
    }
    var radius: CGFloat!
    var colors: [CGColor]!
    
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    init(radius: CGFloat, colors:[CGColor]){
        self.radius = radius
        self.colors = colors
        super.init()
        needsDisplayOnBoundsChange = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
    override func draw(in context: CGContext) {
        context.saveGState()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations) else { return }
        context.drawRadialGradient(gradient, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: radius, options: CGGradientDrawingOptions(rawValue: 0))
    }
}
