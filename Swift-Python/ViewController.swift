//
//  ViewController.swift
//  Swift-Python
//
//  Created by Zh on 2024/12/27.
//

import UIKit
import PythonKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        test_configPyEnv()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        test_callPy()
    }
    
    // test swift call python and python call oc, oc call swift
    private func test_callPy() {
        let example = Python.import("script")
        example.greet("Python")
        let result = example.add(1, 2)
        let sR = Int(result) ?? -1
        print("python return result: ", sR)
    }
    
    // config python env
    private func test_configPyEnv() {
        
        setenv("PYTHONOPTIMIZE", "2", 1)
        setenv("PYTHONDONTWRITEBYTECODE", "1", 1)
        setenv("PYTHONNOUSERSITE", "1", 1)
        setenv("PYTHONPATH", ".", 1)
        setenv("PYTHONUNBUFFERED", "1", 1)
        setenv("LC_CTYPE", "UTF-8", 1)
        
        if let path = Bundle.main.path(forResource: "python", ofType: nil) {
            setenv("PYTHONHOME", path, 1)
        }
        
        // config PYTHONPATH, add path the binary modules in the stdlib
        if let path = Bundle.main.path(forResource: "python/lib/python3.12", ofType: nil) {
//            setenv("PYTHONPATH", path, 1)
            setenv("PYTHONPATH", "\(path):\(path)/lib-dynload", 1)
        }

        let sys = Python.import("sys")

        // test
        print("Python \(sys.version_info.major).\(sys.version_info.minor)")
        print("Python Version: \(sys.version)")
        print("Python Encoding: \(sys.getdefaultencoding().upper())")
       
        // 运行本地py文件
        guard let path = Bundle.main.path(forResource: "app_packages", ofType: nil) else { return }
//        sys.path.append(path)
        sys.path.insert(1, "\(path)")
        
        setenv("TMP", NSTemporaryDirectory(), 1)

//        _ = PythonInitialize(0, nil, importer)
        
        print("Python env config done !")
        
        // test numpy
        /*if let path = Bundle.main.path(forResource: "site-packages", ofType: nil) {
            sys.path.insert(1, "\(path)")
//            sys.path.append(path)
            let np = Python.import("numpy") // import numpy as np
            let arrA = np.array([4, 3, 7])
            let arrB = np.array([9, 3, 5])
            let result = arrA * arrB
            print("numpy test result: ", result)
        }*/
    }
}

