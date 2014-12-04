//
//  ViewController.swift
//  TransitionDemo
//
//  Created by 辉 薛 on 12/4/14.
//  Copyright (c) 2014 tupiance. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIViewControllerTransitioningDelegate {

    required init(coder aDecoder: NSCoder) {
        self.animatior = TransitionAnimator()
        super.init(coder: aDecoder)
    }
    
    var animatior : TransitionAnimator
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animatior;
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return animatior;
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination : UIViewController = segue.destinationViewController as UIViewController
        destination.modalPresentationStyle = UIModalPresentationStyle.Custom
        destination.transitioningDelegate = self;
    }
}

