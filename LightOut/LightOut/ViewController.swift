//
//  ViewController.swift
//  LightOut
//
//  Created by vikas on 12/09/19.
//  Copyright © 2019 project1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func lightOutTapped(_ sender: Any) {
        self.view.backgroundColor = UIColor.black
    }
    
    @IBAction func lightInTapped(_ sender: Any) {
        self.view.backgroundColor = UIColor.yellow
    }
    
}

