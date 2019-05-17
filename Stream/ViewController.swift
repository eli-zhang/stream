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
    let imageNames = ["Location", "Doorbell"]
    let subImageNames = ["West", "Oak"]
    let collegeTownImageNames = ["Bowl", "Tea", "Cookie"]
    let messages = ["where u at", "could someone lemme into kay?", "do you guys want to eat", "want to eat at west?", "want to eat at oken :}", "anyone want to go to collegetown", "oishiiii", "want boba", "free cookies at insomnia"]
    
    var textBox: UIView!
    var textView: UITextView!
    var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        radialGradient = RadialGradientView()
        view.addSubview(radialGradient)
        
        var buttons: [UIButton] = []
        for i in 0..<2 {
            let newButton = UIButton()
            newButton.backgroundColor = UIColor(red: 0.92, green: 0.6, blue: 0.7, alpha: 1)
            newButton.setImage(UIImage(named: imageNames[i]), for: .normal)
            newButton.layer.cornerRadius = 40
            newButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            newButton.layer.shadowOffset = CGSize(width: 5, height: 7)
            newButton.layer.shadowOpacity = 0.8
            newButton.layer.masksToBounds = false
            newButton.addAction(for: .touchUpInside) {
                self.typeText(self.messages[i])
            }
            buttons.append(newButton)
        }
        
        var foodButtons: [UIButton] = []
        for i in 0..<2 {
            let newButton = UIButton()
            newButton.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 0.7, alpha: 1)
            newButton.setImage(UIImage(named: subImageNames[i]), for: .normal)
            newButton.imageView?.tintColor = .white
            newButton.layer.cornerRadius = 30
            newButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            newButton.layer.shadowOffset = CGSize(width: 5, height: 7)
            newButton.layer.shadowOpacity = 0.8
            newButton.layer.masksToBounds = false
            newButton.addAction(for: .touchUpInside) {
                self.typeText(self.messages[3 + i])
            }
            foodButtons.append(newButton)
        }
        
        var collegeTownButtons: [UIButton] = []
        for i in 0..<3 {
            let newButton = UIButton()
            newButton.backgroundColor = UIColor(red: 0.7, green: 0.4, blue: 0.7, alpha: 1)
            newButton.setImage(UIImage(named: collegeTownImageNames[i]), for: .normal)
            newButton.imageView?.tintColor = .white
            newButton.layer.cornerRadius = 25
            newButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            newButton.layer.shadowOffset = CGSize(width: 5, height: 7)
            newButton.layer.shadowOpacity = 0.8
            newButton.layer.masksToBounds = false
            newButton.addAction(for: .touchUpInside) {
                self.typeText(self.messages[6 + i])
            }
            collegeTownButtons.append(newButton)
        }
        
        let collegeTownButton = ParentButton(frame: .zero, buttons: collegeTownButtons, childRadius: 25, startAngle: 270, endAngle: 360, childrenTag: 3)
        collegeTownButton.layer.cornerRadius = 30
        collegeTownButton.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 0.7, alpha: 1)
        collegeTownButton.setImage(UIImage(named: "College"), for: .normal)
        collegeTownButton.imageView?.tintColor = .white
        collegeTownButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        collegeTownButton.layer.shadowOffset = CGSize(width: 5, height: 7)
        collegeTownButton.layer.shadowOpacity = 0.8
        collegeTownButton.layer.masksToBounds = false
        collegeTownButton.addAction(for: .touchUpInside) {
            self.typeText(self.messages[5])
        }
        foodButtons.append(collegeTownButton)
        
        let foodButton = ParentButton(frame: .zero, buttons: foodButtons, childRadius: 30, startAngle: 180, endAngle: 360, childrenTag: 2)
        foodButton.layer.cornerRadius = 40
        foodButton.backgroundColor = UIColor(red: 0.98, green: 0.7, blue: 0.8, alpha: 1)
        foodButton.setImage(UIImage(named: "Cake"), for: .normal)
        foodButton.imageView?.tintColor = .white
        foodButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        foodButton.layer.shadowOffset = CGSize(width: 5, height: 7)
        foodButton.layer.shadowOpacity = 0.8
        foodButton.layer.masksToBounds = false
        foodButton.addAction(for: .touchUpInside) {
            self.typeText(self.messages[2])
        }
        buttons.append(foodButton)

        button = ParentButton(frame: .zero, buttons: buttons, childRadius: 40, startAngle: 0, endAngle: 360, childrenTag: 1)
        button.layer.cornerRadius = 40
        button.backgroundColor = UIColor(red: 0.75, green: 0.8, blue: 0.85, alpha: 1)
        button.setImage(UIImage(named: "Custom"), for: .normal)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 7)
        button.layer.shadowOpacity = 0.8
        button.layer.masksToBounds = false
        button.addAction(for: .touchUpInside) {
            self.textView.text = ""
        }
        view.addSubview(button)
        
        textBox = UIView()
        textBox.layer.cornerRadius = 10
        textBox.backgroundColor = UIColor(red: 0.1, green: 0.12, blue: 0.2, alpha: 0.34)
        view.addSubview(textBox)
        
        textView = UITextView()
        textView.font = UIFont(name: "Nunito-Semibold", size: 15)
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.textColor = UIColor(red: 0.2, green: 0.6, blue: 0.7, alpha: 1)
        textView.text = ""
        textBox.addSubview(textView)
        
        sendButton = UIButton()
//        sendButton.layer.cornerRadius = 15
        sendButton.setImage(UIImage(named: "Arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        sendButton.imageView?.tintColor = .white
        sendButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//        sendButton.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 0.7, alpha: 0.6)
//        sendButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        sendButton.layer.shadowOffset = CGSize(width: 5, height: 7)
//        sendButton.layer.shadowOpacity = 0.8
//        sendButton.layer.masksToBounds = false
        sendButton.addAction(for: .touchUpInside) {
            self.textView.text = ""
        }
        view.addSubview(sendButton)
        
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
        textBox.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view).inset(20)
            make.height.equalTo(60)
        }
        sendButton.snp.makeConstraints { make in
            make.trailing.equalTo(textBox).inset(10)
            make.centerY.equalTo(textBox)
            make.height.width.equalTo(30)
        }
        textView.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(textBox).inset(10)
            make.trailing.equalTo(sendButton).inset(10)
        }

    }
    
    @objc func typeText(_ text: String) {
        textView.text = ""
        textView.animateTyping(string: text)
    }
}

extension UITextView {
    func animateTyping(string: String) {
        let characterArray = Array(string)
        var characterIndex = 0
        Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true) { timer in
            while characterArray[characterIndex] == " " {
                self.text.append(" ")
                characterIndex += 1
                if characterIndex == characterArray.count {
                    timer.invalidate()
                    return
                }
            }
            self.text.append(characterArray[characterIndex])
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
            }
        }
    }
}
