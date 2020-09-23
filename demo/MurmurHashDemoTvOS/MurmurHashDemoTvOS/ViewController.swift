//
//  ViewController.swift
//  MurmurHashDemoTvOS
//
//  Created by Daisuke T on 2019/02/11.
//  Copyright © 2019 MurmurHashDemoTvOS. All rights reserved.
//

import UIKit

import MurmurHash_Swift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Common.x86_32()
        Common.x86_32_file()
        
        Common.x86_128()
        Common.x86_128_file()
        
        Common.x64_128()
        Common.x64_128_file()
    }
    
}

