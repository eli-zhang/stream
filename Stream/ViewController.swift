//
//  ViewController.swift
//  Stream
//
//  Created by Eli Zhang on 5/15/19.
//  Copyright © 2019 Eli Zhang. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var radialGradient: RadialGradientView!
    var button: ParentButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        radialGradient = RadialGradientView()
        view.addSubview(radialGradient)
        
        var buttons: [UIButton] = []
        for _ in 0..<6 {
            let newButton = UIButton()
            newButton.backgroundColor = UIColor(red: 0.92, green: 0.3, blue: 0.5, alpha: 1)
            newButton.setTitle("+", for: .normal)
            newButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
            newButton.titleLabel?.textAlignment = .center
            newButton.setTitleColor(.white, for: .normal)
            newButton.layer.cornerRadius = 40
            newButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            newButton.layer.shadowOffset = CGSize(width: 5, height: 7)
            newButton.layer.shadowOpacity = 0.8
            newButton.layer.masksToBounds = false
            newButton.addTarget(self, action: #selector(printBoi), for: .touchUpInside)
            buttons.append(newButton)
        }
        
        button = ParentButton(frame: .zero, buttons: buttons, childRadius: 80)
        button.layer.cornerRadius = 40
        button.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.62, alpha: 1)
        button.setImage(UIImage(named: "Custom"), for: .normal)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 7)
        button.layer.shadowOpacity = 0.8
        button.layer.masksToBounds = false
        view.addSubview(button)
        setupConstraints()
    }
    
    func setupConstraints() {
        radialGradient.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        button.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.width.height.equalTo(80)
        }
    }
    
    @objc func printBoi() {
        print("button pressed")
    }
}
