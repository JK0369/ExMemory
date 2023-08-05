//
//  ViewController.swift
//  ExMemoryAddress
//
//  Created by 김종권 on 2023/08/05.
//

import UIKit

class ClassA {
    let int = 0
}

struct StructA {
    let int = 0
}

class ViewController: UIViewController {
    var vc = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var a = [1, 2, 3]
        var classA = ClassA()
        var structA = StructA()
        var b = [1, 2, 3]
        
        [
            address(&a),
            address(&classA),
            address(&b),
            address(&structA),
            address(&vc)
        ]
            .forEach { print($0) }
        
        /*
         (value type) 0x600001ce51e0
         (ref type)   0x16b5bf8e8
         (value type) 0x600001ce5220
         (value type) 0x16b5bf8e0
         (ref type)   0x16b5bf890
         */
        
        Memory.dump(object: vc)
    }
}

// https://gist.github.com/matsuda/0dbb9721a9ee8cddb8b09d885c8f4290
func address(_ o: UnsafeRawPointer) -> String {
    let bit = Int(bitPattern: o)
    return String(format: "%p", bit)
}
