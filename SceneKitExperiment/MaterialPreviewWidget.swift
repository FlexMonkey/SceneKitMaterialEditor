//
//  MaterialPreviewWidget.swift
//  SceneKitExperiment
//
//  Created by Simon Gladman on 25/01/2015.
//  Copyright (c) 2015 Simon Gladman. All rights reserved.
//

import Foundation
import SceneKit

class MaterialPreviewWidget: SCNView
{
    let spehere = SCNSphere(radius: 6)
    
    var material: SCNMaterial = SCNMaterial()
    {
        didSet
        {
            spehere.materials = [material]
        }
    }
    
    override func didMoveToSuperview()
    {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1.0)
        layer.borderColor = UIColor.darkGrayColor().CGColor
        layer.borderWidth = 1
        
        let thisScene = SCNScene()
        
        scene = thisScene

        // camera...
        
        let camera = SCNCamera()
        
        camera.xFov = 45
        camera.yFov = 45
        
        let cameraNode = SCNNode()
        
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 20)
        
        thisScene.rootNode.addChildNode(cameraNode)
        
        // sphere...
        
        let sphereNode = SCNNode(geometry: spehere)
        sphereNode.position = SCNVector3(x: 0, y: 0, z: 0)
        thisScene.rootNode.addChildNode(sphereNode)
        
        spehere.materials = [material]
        
        // ambient light...
        
        let ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        ambientLight.color = UIColor(white: 0.25, alpha: 1.0)
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        
        thisScene.rootNode.addChildNode(ambientLightNode)
        
        // omni light...
        
        let omniLight = SCNLight()
        omniLight.type = SCNLightTypeOmni
        omniLight.color = UIColor(white: 1.0, alpha: 1.0)
        let omniLightNode = SCNNode()
        omniLightNode.light = omniLight
        omniLightNode.position = SCNVector3(x: -5, y: 8, z: 10)
        
        thisScene.rootNode.addChildNode(omniLightNode)
        
        // floor...
        
        let floor = SCNFloor()
        let floorNode = SCNNode(geometry: floor)
        floorNode.position = SCNVector3(x: 0, y: -6.2, z: 0)
        
        thisScene.rootNode.addChildNode(floorNode)
    }
}