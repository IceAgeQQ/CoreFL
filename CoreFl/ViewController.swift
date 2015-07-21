//
//  ViewController.swift
//  CoreFl
//
//  Created by Chao Xu on 15/7/17.
//  Copyright (c) 2015年 Chao Xu. All rights reserved.
//

import UIKit

var isGraphViewShowing = false

class ViewController: UIViewController {
    //Counter outlets
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var averageWaterDrunk: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counterLabel.text = String(counterView.counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPushButton(button: PushButtonView) {
        if button.isAddButton {
            counterView.counter++
        } else {
            if counterView.counter > 0 {
                counterView.counter--
             }
        }
    counterLabel.text = String(counterView.counter)
        
        if isGraphViewShowing{
            counterViewTap(nil)
        }
    }

    @IBAction func counterViewTap(gesture:UITapGestureRecognizer?){
        if(isGraphViewShowing){
            //hide graph
            UIView.transitionFromView(graphView, toView: counterView, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
        }else {
            // show graph
            UIView.transitionFromView(counterView, toView: graphView, duration: 1.0, options: UIViewAnimationOptions.ShowHideTransitionViews, completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }
    func setupGraphDisplay(){
        //Use 7 days for graph - can use any number,
        //but labels and sample data are set up for 7 days
        let noOfDays:Int = 7
        //1 - replace last day with today's actual data
        graphView.graphPoints[graphView.graphPoints.count-1] = counterView.counter
    }

    
}

























































