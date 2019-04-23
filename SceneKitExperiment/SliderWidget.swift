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
    let slider = UISlider(frame: CGRect.zero)
    let label = UILabel(frame: CGRect.zero)
    
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
        slider.addTarget(self, action: #selector(SliderWidget.sliderChangeHandler), for: .valueChanged)
        
        layer.cornerRadius = 5
        layer.backgroundColor = UIColor.darkGray.withAlphaComponent(0.25).cgColor
        
        addSubview(slider)
        addSubview(label)
    }
    
    @objc func sliderChangeHandler()
    {
        value = CGFloat(slider.value)
        
        sendActions(for: .valueChanged)
    }
    
    func updateLabel()
    {
        print(value)
        
        label.text = title + ": " + (NSString(format: "%.3f", Float(value)) as String)
    }
    
    override func layoutSubviews()
    {
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 2).insetBy(dx: 5, dy: 5)
        slider.frame = CGRect(x: 0, y: frame.height / 2, width: frame.width, height: frame.height / 2).insetBy(dx: 5, dy: 5)
    }
}


