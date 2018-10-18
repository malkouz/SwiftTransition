//
//  MNavigationTranstion.swift
//  TransitionExample
//
//  Created by Moayad Al kouz on 8/20/17.
//  Copyright © 2017 malkouz. All rights reserved.
//

import UIKit

open class MNavigationTranstion: NSObject, UIViewControllerAnimatedTransitioning {
    
    public var transformValue: CGFloat = 0.06
    
    public var circle = UIView()
    
    public var startingPoint = CGPoint.zero {
        didSet {
            circle.center = startingPoint
        }
    }
    
    public var circleColor = UIColor.white
    
    public var duration = 0.30
    
    public var operation: UINavigationController.Operation = .push
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        let containerView = transitionContext.containerView
        
        if operation == .push {
            // do animation for push
            if let presentedView = toViewController.view {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                
                circle = UIView()
                
                circle.frame = UIView.frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                
                circle.layer.cornerRadius = circle.frame.size.height / 2
                circle.center = startingPoint
                circle.backgroundColor = circleColor
                circle.transform = CGAffineTransform(scaleX: transformValue, y: transformValue)
                
                containerView.addSubview(circle)
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: transformValue, y: transformValue)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: { [unowned self] in
                    self.circle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    
                    presentedView.center = viewCenter
                    
                    }, completion: { [unowned self] (success:Bool) in
                        
                        UIView.animate(withDuration: 0.05, animations: {
                            presentedView.alpha = 1
                        })
                        self.operation = .pop
                        transitionContext.completeTransition(success)
                })
                
            }
        } else if operation == .pop {
            // do animation for pop
            if let returningView = fromViewController.view {
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size
                
                circle.frame = UIView.frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                circle.layer.cornerRadius = circle.frame.size.height / 2
                circle.center = startingPoint
                
                UIView.animate(withDuration: 0.05, animations: {
                    returningView.alpha = 0
                })
                
                UIView.animate(withDuration: duration, animations: { [unowned self] in
                    
                    self.circle.transform = CGAffineTransform(scaleX: self.transformValue, y: self.transformValue)
                    returningView.transform = CGAffineTransform(scaleX: self.transformValue, y: self.transformValue)
                    returningView.center = self.startingPoint
                    
                    }, completion: { [unowned self](success:Bool) in
                        
                        returningView.center = viewCenter
                        returningView.removeFromSuperview()
                        
                        self.circle.removeFromSuperview()
                        self.operation = .push
                        containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)
                        transitionContext.completeTransition(success)
                })
            }
        }
    }
}
