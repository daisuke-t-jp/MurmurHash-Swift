//
//  ViewController.swift
//  MurmurHashDemoiOS
//
//  Created by Daisuke T on 2019/02/07.
//  Copyright © 2019 MurmurHashDemoiOS. All rights reserved.
//

import UIKit

import MurmurHash_Swift

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		print(MurmurHash3.x86_32("Hello World!"))
		
	}


}

