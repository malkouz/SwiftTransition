//
//  SecondViewController.swift
//  TransitionExample
//
//  Created by Moayad Al kouz on 8/8/17.
//  Copyright © 2017 malkouz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var btnHide: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func hideAction(sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
