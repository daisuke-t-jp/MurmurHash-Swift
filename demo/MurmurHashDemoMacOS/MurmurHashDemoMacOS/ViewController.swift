//
//  ViewController.swift
//  MurmurHashDemoMacOS
//
//  Created by Daisuke T on 2019/02/07.
//  Copyright © 2019 MurmurHashDemoMacOS. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Common.x86_32()
        Common.x86_32_file()
        
        Common.x86_128()
        Common.x86_128_file()
        
        Common.x64_128()
        Common.x64_128_file()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
}

