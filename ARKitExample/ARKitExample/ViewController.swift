//
//  ViewController.swift
//  ARKitExample
//
//  Created by Viktor Siedov on 15.08.2018.
//  Copyright © 2018 Viktor Siedov. All rights reserved.
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
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        //"art.scnassets/ant/formica_rufa.fbx"
        
//            + (SCNAssimpScene *)assimpSceneNamed:(NSString *)name
//        postProcessFlags:
//        (AssimpKitPostProcessSteps)postProcessFlags;
        
//        let assimp = SCNAssimpScene.assimpScene(with:URL(fileURLWithPath: "art.scnassets/ant/formica_rufa.fbx"), postProcessFlags:[.process_FlipUVs,.process_Triangulate])!
        
        
        let assimp = SCNAssimpScene.assimpSceneNamed("art.scnassets/spider/Spider.fbx", postProcessFlags: [.process_FlipUVs,.process_Triangulate])!
        
//            AssimpKit_Process_FlipUVs |
//            AssimpKit_Process_Triangulate)
        
        
        
        // retrieve the SCNView
//        SCNView *scnView = (SCNView *)self.view;
//
//        // set the model scene to the view
//        scnView.scene = scene.modelScene;
        
        let scnView:SCNView = view as! SCNView
        
        // Set the scene to the view
        scnView.scene = assimp.modelScene;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}