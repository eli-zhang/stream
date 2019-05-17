//
//  Closure.swift
//  Stream
//
//  Created by Eli Zhang on 5/16/19.
//  Copyright © 2019 Eli Zhang. All rights reserved.
//

import UIKit

class Closure {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event, _ closure: @escaping ()->()) {
        let sleeve = Closure(closure)
        addTarget(sleeve, action: #selector(Closure.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
