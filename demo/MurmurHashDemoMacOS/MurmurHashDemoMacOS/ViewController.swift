//
//  ViewController.swift
//  MurmurHashDemoMacOS
//
//  Created by Daisuke T on 2019/02/07.
//  Copyright © 2019 MurmurHashDemoMacOS. All rights reserved.
//

import Cocoa
import MurmurHash_Swift

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		
		print(MurmurHash3.x86_32("Hello World!"))
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

