//
//  ViewController.swift
//  AnimatorDemo
//
//  Created by 辉 薛 on 12/5/14.
//  Copyright (c) 2014 tupiance. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var flowingView : UIView!

    var animator : UIDynamicAnimator!;
    var panGesturer : UIPanGestureRecognizer! = nil;
    

    override func viewDidLoad() {
        super.viewDidLoad()

        panGesturer = UIPanGestureRecognizer();
        panGesturer.addTarget(self, action: "handleGesture:")
        panGesturer.delegate = self;
        self.view.addGestureRecognizer(panGesturer!);
        
        animator = UIDynamicAnimator(referenceView: self.view);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleGesture(gesture:UIPanGestureRecognizer) {
        switch gesture.state {
        case .Changed:
            let point:CGPoint = gesture.locationInView(self.view)
            flowingView.center = point
                
        case .Ended:
            animator.removeAllBehaviors()

//            var behavior: UIGravityBehavior = UIGravityBehavior()
//            behavior.addItem(flowingView)
//            behavior.setAngle(1.57, magnitude: 2)
//            animator.addBehavior(behavior)
//            
//            let pushBehavior : UIPushBehavior = UIPushBehavior(items: [flowingView], mode: .Instantaneous)
//            pushBehavior.angle = 0;
//            pushBehavior.magnitude = 2
//            animator.addBehavior(pushBehavior)
            
//            let snapBehavior : UISnapBehavior = UISnapBehavior(item: flowingView, snapToPoint: CGPoint(x: 100,y: 100))
//            snapBehavior.damping = 0.3
//            animator.addBehavior(snapBehavior)
            
            let attachBehavior : UIAttachmentBehavior = UIAttachmentBehavior(item: flowingView, attachedToAnchor: CGPoint(x: 200,y: 200))
            attachBehavior.frequency = 1
            attachBehavior.damping = 0.5
            attachBehavior.length = 10;
            animator.addBehavior(attachBehavior)
            
//            animator.updateItemUsingCurrentState(flowingView)
                break;
        default : break;
        }
    }
}

