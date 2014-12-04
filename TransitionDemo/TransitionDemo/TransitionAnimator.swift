//
//  TransitionPresentationAnimator.swift
//  TransitionDemo
//
//  Created by 辉 薛 on 12/4/14.
//  Copyright (c) 2014 tupiance. All rights reserved.
//

import UIKit

class TransitionAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1.0;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let source = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let destination = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()
        
        let animateDuration = self.transitionDuration(transitionContext)
        
        containerView.addSubview(destination.view)
        containerView.addSubview(source.view)
        
        UIView.animateWithDuration(animateDuration, delay: 0.0, options: .CurveEaseInOut , animations: { () -> Void in
            source.view.alpha = 0.0
            }) { (finished) -> Void in
                source.view.removeFromSuperview()
                transitionContext.completeTransition(finished)
        }
    }
}
