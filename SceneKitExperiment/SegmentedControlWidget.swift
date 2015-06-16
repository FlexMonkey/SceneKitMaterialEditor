//
//  SegmentedControlWidget.swift
//  SceneKitExperiment
//
//  Created by Simon Gladman on 25/01/2015.
//  Copyright (c) 2015 Simon Gladman. All rights reserved.
//

import UIKit

class SegmentedFilterControlWidget: UIControl
{
    let items = ["Droste", "CMYK Halftone", "Pixellate", "None"]
    
    var segmentedControl: UISegmentedControl!
    
    let label = UILabel(frame: CGRectZero)
    
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
        
        segmentedControl.addTarget(self, action: "segmentedControlChangeHandler", forControlEvents: .ValueChanged)
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 2
        layer.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.25).CGColor
        
        addSubview(segmentedControl)
        addSubview(label)
    }
    
    func segmentedControlChangeHandler()
    {
        sendActionsForControlEvents(.ValueChanged)
    }
    
    var value: CIFilter?
    {
        let returnFilter: CIFilter?
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            returnFilter = CIFilter(name: "CIDroste", withInputParameters: ["inputStrands": 4])!
        case 1:
            returnFilter = CIFilter(name: "CICMYKHalftone", withInputParameters: ["inputWidth": 20])!
        case 2:
            returnFilter = CIFilter(name: "CIPixellate", withInputParameters: [kCIInputScaleKey: 30])!
        default:
            returnFilter = nil
        }
        
        return returnFilter
    }
    
    override func layoutSubviews()
    {
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 2).rectByInsetting(dx: 5, dy: 5)
        segmentedControl.frame = CGRect(x: 0, y: frame.height / 2, width: frame.width, height: frame.height / 2).rectByInsetting(dx: 5, dy: 5)
    }
}

class SegmentedControlWidget: UIControl
{
    let items = [TextureContents.Metallic.rawValue, TextureContents.Seventies.rawValue, TextureContents.Night.rawValue, TextureContents.Sunny.rawValue, TextureContents.Bump.rawValue, TextureContents.Red.rawValue, TextureContents.Green.rawValue, TextureContents.Blue.rawValue, TextureContents.White.rawValue, TextureContents.Black.rawValue]
    
    var segmentedControl: UISegmentedControl!
    
    let label = UILabel(frame: CGRectZero)
    
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
        
        segmentedControl.addTarget(self, action: "segmentedControlChangeHandler", forControlEvents: .ValueChanged)
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 2
        layer.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.25).CGColor
        
        addSubview(segmentedControl)
        addSubview(label)
    }
    
    func segmentedControlChangeHandler()
    {
        sendActionsForControlEvents(.ValueChanged)
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
                return UIColor.redColor()
            case TextureContents.Green:
                return UIColor.greenColor()
            case TextureContents.Blue:
                return UIColor.blueColor()
            case TextureContents.White:
                return UIColor.whiteColor()
            case TextureContents.Black:
                return UIColor.blackColor()
            }
        }
    }
    
    override func layoutSubviews()
    {
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 2).rectByInsetting(dx: 5, dy: 5)
        segmentedControl.frame = CGRect(x: 0, y: frame.height / 2, width: frame.width, height: frame.height / 2).rectByInsetting(dx: 5, dy: 5)
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