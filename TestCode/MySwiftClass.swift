//
//  MySwiftClass.swift
//  Swift-Python
//
//  Created by Zh on 2024/12/27.
//

import Foundation

@objc public class MySwiftClass: NSObject {
    @objc public func greet(name: String) -> String {
        print("OC call Swift succeeded! Swift: get params: '\(name)' succeed from Python!")
        return "callback: Hello python, I'm return by Swift !"
    }
}
