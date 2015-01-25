//
//  SliderWidget.swift
//  SceneKitExperiment
//
//  Created by Simon Gladman on 04/11/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class SliderWidget: UIControl
{
    let slider = UISlider(frame: CGRectZero)
    let label = UILabel(frame: CGRectZero)
    
    var title: String = ""
    {
        didSet
        {
            updateLabel()
        }
    }
    
    var value: CGFloat = 0
    {
        didSet
        {
            slider.value = Float(value)
            updateLabel()
        }
    }
    
    override func didMoveToSuperview()
    {
        slider.addTarget(self, action: "sliderChangeHandler", forControlEvents: .ValueChanged)
        
        layer.cornerRadius = 5
        layer.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.25).CGColor
        
        addSubview(slider)
        addSubview(label)
    }
    
    func sliderChangeHandler()
    {
        value = CGFloat(slider.value)
        
        sendActionsForControlEvents(.ValueChanged)
    }
    
    func updateLabel()
    {
        println(value)
        
        label.text = title + ": " + NSString(format: "%.3f", Float(value))
    }
    
    override func layoutSubviews()
    {
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 2).rectByInsetting(dx: 5, dy: 5)
        slider.frame = CGRect(x: 0, y: frame.height / 2, width: frame.width, height: frame.height / 2).rectByInsetting(dx: 5, dy: 5)
    }
}


