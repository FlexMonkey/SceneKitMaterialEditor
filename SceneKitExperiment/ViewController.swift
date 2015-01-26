//
//  ViewController.swift
//  SceneKitExperiment
//
//  Created by Simon Gladman on 25/01/2015.
//  Copyright (c) 2015 Simon Gladman. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController, UIPickerViewDelegate
{
    let materialPreviewWidget = MaterialPreviewWidget()
    let widgetWidth: Int = 300
    
    let fresnelExponentSlider = SliderWidget(frame: CGRectZero)
    let shininessSlider = SliderWidget(frame: CGRectZero)
    let transparencySlider = SliderWidget(frame: CGRectZero)
    
    let specularSegmentedControl = SegmentedControlWidget(frame: CGRectZero)
    let diffuseSegmentedControl = SegmentedControlWidget(frame: CGRectZero)
    let reflectiveSegmentedControl = SegmentedControlWidget(frame: CGRectZero)
    let normalSegmentedControl = SegmentedControlWidget(frame: CGRectZero)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        view.addSubview(materialPreviewWidget)
        
        fresnelExponentSlider.title = "Fresnel Exponent"
        shininessSlider.title = "Shininess"
        transparencySlider.title = "Transparency"
        
        view.addSubview(fresnelExponentSlider)
        view.addSubview(shininessSlider)
        view.addSubview(transparencySlider)
        
        specularSegmentedControl.title = "Specular"
        diffuseSegmentedControl.title = "Diffuse"
        reflectiveSegmentedControl.title = "Reflective"
        normalSegmentedControl.title = "Normal"
        
        view.addSubview(specularSegmentedControl)
        view.addSubview(diffuseSegmentedControl)
        view.addSubview(reflectiveSegmentedControl)
        view.addSubview(normalSegmentedControl)
        
        fresnelExponentSlider.value = materialPreviewWidget.material.fresnelExponent
        shininessSlider.value = materialPreviewWidget.material.shininess
        transparencySlider.value = materialPreviewWidget.material.transparency
        
        fresnelExponentSlider.addTarget(self, action: "propertySliderChange", forControlEvents: UIControlEvents.ValueChanged)
        shininessSlider.addTarget(self, action: "propertySliderChange", forControlEvents: UIControlEvents.ValueChanged)
        transparencySlider.addTarget(self, action: "propertySliderChange", forControlEvents: UIControlEvents.ValueChanged)
        
        specularSegmentedControl.addTarget(self, action: "propertySliderChange", forControlEvents: UIControlEvents.ValueChanged)
        diffuseSegmentedControl.addTarget(self, action: "propertySliderChange", forControlEvents: UIControlEvents.ValueChanged)
        reflectiveSegmentedControl.addTarget(self, action: "propertySliderChange", forControlEvents: UIControlEvents.ValueChanged)
        normalSegmentedControl.addTarget(self, action: "propertySliderChange", forControlEvents: UIControlEvents.ValueChanged)
    }

    func propertySliderChange()
    {
        materialPreviewWidget.material.fresnelExponent = fresnelExponentSlider.value
        materialPreviewWidget.material.shininess = shininessSlider.value
        materialPreviewWidget.material.transparency = transparencySlider.value
 
        materialPreviewWidget.material.specular.contents = specularSegmentedControl.value
        materialPreviewWidget.material.diffuse.contents = diffuseSegmentedControl.value
        materialPreviewWidget.material.reflective.contents = reflectiveSegmentedControl.value
        materialPreviewWidget.material.normal.contents = normalSegmentedControl.value
    }

    
    override func viewDidLayoutSubviews()
    {
        let xPosition: Int = Int(view.frame.width) / 2 - widgetWidth / 2
        materialPreviewWidget.frame = CGRect(x: xPosition, y: 50, width: widgetWidth, height: widgetWidth)
        
        fresnelExponentSlider.frame = CGRect(x: 0, y: view.frame.height - 300 , width: view.frame.width / 2, height: 80).rectByInsetting(dx: 5, dy: 5)
        shininessSlider.frame = CGRect(x: 0, y: view.frame.height - 200 , width: view.frame.width / 2, height: 80).rectByInsetting(dx: 5, dy: 5)
        transparencySlider.frame = CGRect(x: 0, y: view.frame.height - 100 , width: view.frame.width / 2, height: 80).rectByInsetting(dx: 5, dy: 5)
       
        normalSegmentedControl.frame = CGRect(x: view.frame.width / 2, y: view.frame.height - 400 , width: view.frame.width / 2, height: 80).rectByInsetting(dx: 5, dy: 5)
        specularSegmentedControl.frame = CGRect(x: view.frame.width / 2, y: view.frame.height - 300 , width: view.frame.width / 2, height: 80).rectByInsetting(dx: 5, dy: 5)
        diffuseSegmentedControl.frame = CGRect(x: view.frame.width / 2, y: view.frame.height - 200 , width: view.frame.width / 2, height: 80).rectByInsetting(dx: 5, dy: 5)
        reflectiveSegmentedControl.frame = CGRect(x: view.frame.width / 2, y: view.frame.height - 100 , width: view.frame.width / 2, height: 80).rectByInsetting(dx: 5, dy: 5)

    }
    
    override func supportedInterfaceOrientations() -> Int
    {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }

}



