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

    var button: ParentButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        var buttons: [UIButton] = []
        for _ in 0..<6 {
            let newButton = UIButton()
            newButton.backgroundColor = .purple
            newButton.setTitle("+", for: .normal)
            newButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
            newButton.titleLabel?.textAlignment = .center
            newButton.setTitleColor(.white, for: .normal)
            newButton.layer.cornerRadius = 40
            newButton.layer.masksToBounds = false
            newButton.addTarget(self, action: #selector(printBoi), for: .touchUpInside)
            buttons.append(newButton)
        }
        
        button = ParentButton(frame: .zero, buttons: buttons, childRadius: 80)
        button.layer.cornerRadius = 40
        button.backgroundColor = .blue
        view.addSubview(button)
        setupConstraints()
    }
    
    func setupConstraints() {
        button.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.width.height.equalTo(80)
        }
    }
    
    @objc func printBoi() {
        print("button pressed")
    }
}
