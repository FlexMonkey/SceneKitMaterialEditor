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
    let materialPreviewWidget = MaterialPreviewWidget(frame: CGRectZero,
        options: [SCNPreferredRenderingAPIKey : SCNRenderingAPI.OpenGLES2.rawValue])
    
    let fresnelExponentSlider = SliderWidget()
    let shininessSlider = SliderWidget()
    let transparencySlider = SliderWidget()
    
    let specularSegmentedControl = SegmentedControlWidget()
    let diffuseSegmentedControl = SegmentedControlWidget()
    let reflectiveSegmentedControl = SegmentedControlWidget()
    let normalSegmentedControl = SegmentedControlWidget()
    
    let filterControl = SegmentedFilterControlWidget()
    
    let mainStackView = UIStackView()
    let controlsView = UIStackView()
    let controlsLeftColumn = UIStackView()
    let controlsRightColumn = UIStackView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(materialPreviewWidget)
        mainStackView.addArrangedSubview(controlsView)
        
        controlsView.addArrangedSubview(controlsLeftColumn)
        controlsView.addArrangedSubview(controlsRightColumn)
        
        controlsLeftColumn.addArrangedSubview(filterControl)
        controlsLeftColumn.addArrangedSubview(fresnelExponentSlider)
        controlsLeftColumn.addArrangedSubview(shininessSlider)
        controlsLeftColumn.addArrangedSubview(transparencySlider)
        
        controlsRightColumn.addArrangedSubview(normalSegmentedControl)
        controlsRightColumn.addArrangedSubview(specularSegmentedControl)
        controlsRightColumn.addArrangedSubview(diffuseSegmentedControl)
        controlsRightColumn.addArrangedSubview(reflectiveSegmentedControl) 
        
        mainStackView.axis = UILayoutConstraintAxis.Vertical
        controlsView.axis = UILayoutConstraintAxis.Horizontal
        controlsLeftColumn.axis = UILayoutConstraintAxis.Vertical
        controlsRightColumn.axis = UILayoutConstraintAxis.Vertical

        mainStackView.distribution = UIStackViewDistribution.FillEqually
        controlsView.distribution = UIStackViewDistribution.FillEqually
        controlsLeftColumn.distribution = UIStackViewDistribution.FillEqually
        controlsRightColumn.distribution = UIStackViewDistribution.FillEqually
        
        for widget in [filterControl, fresnelExponentSlider, shininessSlider, transparencySlider, specularSegmentedControl, diffuseSegmentedControl, reflectiveSegmentedControl, normalSegmentedControl]
        {
            widget.addTarget(self, action: "propertySliderChange", forControlEvents: UIControlEvents.ValueChanged)
        }
        
        setWidgetTitles()
        setDefaults()
        propertySliderChange()
    }

    func setWidgetTitles()
    {
        fresnelExponentSlider.title = "Fresnel Exponent"
        shininessSlider.title = "Shininess"
        transparencySlider.title = "Transparency"
        filterControl.title = "Filter"
        specularSegmentedControl.title = "Specular"
        diffuseSegmentedControl.title = "Diffuse"
        reflectiveSegmentedControl.title = "Reflective"
        normalSegmentedControl.title = "Normal"
    }
    
    func setDefaults()
    {
        normalSegmentedControl.segmentedControl.selectedSegmentIndex = 4
        specularSegmentedControl.segmentedControl.selectedSegmentIndex = 3
        diffuseSegmentedControl.segmentedControl.selectedSegmentIndex = 7
        reflectiveSegmentedControl.segmentedControl.selectedSegmentIndex = 3
        
        transparencySlider.value = 1.0
        shininessSlider.value = 0.1
        fresnelExponentSlider.value = 0.25
        filterControl.segmentedControl.selectedSegmentIndex = 5
    }
    
    func propertySliderChange()
    {
        materialPreviewWidget.filter = filterControl.value
        
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
        super.viewDidLayoutSubviews()
        
        let top = topLayoutGuide.length
        let bottom = bottomLayoutGuide.length
        
        mainStackView.frame = CGRect(x: 0, y: top, width: view.frame.width, height: view.frame.height - top - bottom).insetBy(dx: 10, dy: 10)
        
        dispatch_async(dispatch_get_main_queue())
        {
            self.controlsView.axis = self.view.frame.width < self.view.frame.height ? UILayoutConstraintAxis.Vertical : UILayoutConstraintAxis.Horizontal
        }
    }
    

}



