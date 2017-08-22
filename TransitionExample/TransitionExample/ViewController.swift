//
//  ViewController.swift
//  TransitionExample
//
//  Created by Moayad Al kouz on 8/8/17.
//  Copyright © 2017 malkouz. All rights reserved.
//

import UIKit
import SwiftTransition



class ViewController: UIViewController,UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    
    let transition = MTransition()
    let navTranstion = MNavigationTranstion()
    
    @IBOutlet weak var btnShow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- presentation methods & delegate
    @IBAction func backAction(sender: UIButton){
        self.dismiss(animated: true, completion: {
            
        })
    }
    
    @IBAction func presentAction(sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
        
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        transition.startingPoint = btnShow.center
        transition.circleColor = btnShow.backgroundColor!
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        return transition
    }
    
    //MARK:- naviagation methods & delegate
    @IBAction func navBackAction(sender: UIBarButtonItem){
        self.navigationController?.dismiss(animated: true, completion: {
            
        })
    }
    
    
    @IBAction func pushAction(sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavSecondViewController")
        
        if let navigationVC = self.navigationController{
            navTranstion.startingPoint = btnShow.center
            navTranstion.circleColor = btnShow.backgroundColor!
            
            navigationVC.pushViewController(vc, animated: true)
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        navTranstion.operation = operation
        navigationController.view.backgroundColor = self.view.backgroundColor
        return navTranstion
    }
}

