//
//  ViewController.swift
//  TransitionExample
//
//  Created by Moayad Al kouz on 8/8/17.
//  Copyright © 2017 malkouz. All rights reserved.
//

import UIKit
import SwiftTransition

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {

    
    let transition = MTransition()
    
    @IBOutlet weak var btnShow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showAction(sender: UIButton){
//        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
//        vc.transitioningDelegate = self
//        vc.modalPresentationStyle = .custom
//        transition.startingPoint = btnShow.center
//        transition.circleColor = btnShow.backgroundColor!
    }
    
    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.transitionMode = .present
//        return transition
//    }
//    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.transitionMode = .dismiss
//        return transition
//    }
}

