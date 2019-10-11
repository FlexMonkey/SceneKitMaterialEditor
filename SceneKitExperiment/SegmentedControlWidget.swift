//
//  SegmentedControlWidget.swift
//  SceneKitExperiment
//
//  Created by Simon Gladman on 25/01/2015.
//  Copyright (c) 2015 Simon Gladman. All rights reserved.
//

import UIKit

class SegmentedControlWidget: UIControl
{
    let items = [TextureContents.Metallic.rawValue, TextureContents.Seventies.rawValue, TextureContents.Night.rawValue, TextureContents.Sunny.rawValue, TextureContents.Bump.rawValue, TextureContents.Red.rawValue, TextureContents.Green.rawValue, TextureContents.Blue.rawValue, TextureContents.White.rawValue, TextureContents.Black.rawValue]
    
    var segmentedControl: UISegmentedControl!
    
    let label = UILabel(frame: CGRect.zero)
    
    var title: String = ""
    {
        didSet
        {
             label.text = title 
        }
    }
    
    override func didMoveToSuperview()
    {
        segmentedControl = UISegmentedControl(items: items)
        
        segmentedControl.addTarget(self, action: #selector(SegmentedControlWidget.segmentedControlChangeHandler), for: .valueChanged)
        
        layer.cornerRadius = 5
        layer.backgroundColor = UIColor.darkGray.withAlphaComponent(0.25).cgColor
        
        addSubview(segmentedControl)
        addSubview(label)
    }
    
    @objc func segmentedControlChangeHandler()
    {
        sendActions(for: .valueChanged)
    }
    
    var value: AnyObject?
    {
        get
        {
            if segmentedControl.selectedSegmentIndex < 0
            {
                return nil
            }
            
            switch TextureContents(rawValue: items[segmentedControl.selectedSegmentIndex])!
            {
            case TextureContents.Metallic:
                return UIImage(named: "metallic.jpg")
            case TextureContents.Seventies:
                return UIImage(named: "70s-flower.jpg")
            case TextureContents.Night:
                return UIImage(named: "night-sky-stars.jpg")
            case TextureContents.Sunny:
                return UIImage(named: "sunny-landscape.jpg")
            case TextureContents.Bump:
                return UIImage(named: "bumpMap.jpg")
            case TextureContents.Red:
                return UIColor.red
            case TextureContents.Green:
                return UIColor.green
            case TextureContents.Blue:
                return UIColor.blue
            case TextureContents.White:
                return UIColor.white
            case TextureContents.Black:
                return UIColor.black
            }
        }
    }
    
    override func layoutSubviews()
    {
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 2).insetBy(dx: 5, dy: 5)
        segmentedControl.frame = CGRect(x: 0, y: frame.height / 2, width: frame.width, height: frame.height / 2).insetBy(dx: 5, dy: 5)
    }
}

enum TextureContents: String
{
    case Metallic = "Metal"
    case Seventies = "70's"
    case Night = "Night"
    case Sunny = "Sunny"
    case Bump = "Bump"
    case Red = "Red"
    case Green = "Green"
    case Blue = "Blue"
    case White = "White"
    case Black = "Black"
}
