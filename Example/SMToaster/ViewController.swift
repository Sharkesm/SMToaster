//
//  ViewController.swift
//  SMToaster
//
//  Created by Sharkes Monken on 08/09/2019.
//  Copyright (c) 2019 Sharkes Monken. All rights reserved.
//

import UIKit
import SMToaster

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toaster = SMToaster(title: "Toast Header", message: "I will display any content to give a brief summary about the toaster")
        
        view.addSubview(toaster)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

