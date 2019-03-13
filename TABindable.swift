//
//  Bindable.swift
//  Bindable
//
//  Created by Jakub Kozák on 13/03/2019.
//  Copyright © 2019 Jakub Kozák. All rights reserved.
//

import Foundation
import UIKit

class Dynamic<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bindWithoutFiring(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}

extension UILabel {
    func bindTo(_ target:Dynamic<String>) {
        target.bind{ self.text = $0 }
    }
}

extension UIButton {
    func bindTo(_ target:Dynamic<String>) {
        target.bind{ self.setTitle($0, for: .normal) }
    }
}
