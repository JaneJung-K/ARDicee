//
//  ViewController.swift
//  ARDicee
//
//  Created by mac on 2021/03/26.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01) //사각형
        
//        let sphere = SCNSphere(radius: 0.2)
//
//        let material = SCNMaterial() //물체 표면 속성
//
//        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
//
//        sphere.materials = [material]
//
//        let node = SCNNode() //콘텐츠를 연결할 수 있는 3D 좌표 공간에서 위치와 변환을 나타내는 장면 그래프의 구조 요소
//
//        node.position = SCNVector3(0, 0.1, -0.5)
//
//        node.geometry = sphere
//
//        sceneView.scene.rootNode.addChildNode(node)
        
        //주사위가 3D처럼 보이지 않는다. 빛을 추가하자.
        sceneView.autoenablesDefaultLighting = true
        
        
        // Create a new scene
        let dicescene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        //실제적으로 Dice에는 recursively: true 할 것이 없지만 좋은 습관이다.
        if let diceNode = dicescene.rootNode.childNode(withName: "Dice", recursively: true) {
        
        diceNode.position = SCNVector3(0, 0, -0.1)
        
        sceneView.scene.rootNode.addChildNode(diceNode)
        
        }

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        print("Session is supported = \(ARConfiguration.isSupported)")
        print("World Tracking is supported = \(ARWorldTrackingConfiguration.isSupported)")

        // Run the view's session
        sceneView.session.run(configuration)
        }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }


}
