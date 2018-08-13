//
//  ViewController.swift
//  ARKitExample
//
//  Created by Viktor Siedov on 09.08.2018.
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
        
//        let scene = SCNScene(named: "art.scnassets/ant/formica rufa.fbx")!
        
//        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        documentsDirectoryURL = [documentsDirectoryURL URLByAppendingPathComponent:@"product-1-optimized.scnassets/cube.dae"];
//
//        SCNSceneSource *sceneSource = [SCNSceneSource sceneSourceWithURL:documentsDirectoryURL options:nil]
        
        
//        let desktopURL = NSURL(fileURLWithPath: "/Users/jappleseed/Desktop/")
//        do {
//            let temporaryDirectoryURL = try NSFileManager.defaultManager().URLForDirectory(.ItemReplacementDirectory, inDomain: .UserDomainMask, appropriateForURL: desktopURL, create: true)
//        } catch {
//            // handle the error
//        }
        
        //load our file
        let antScene = SCNScene(named: "art.scnassets/ant/formica_rufa.fbx")!
        
        //create noda
        let node = SCNNode()
        
        // Add all the child nodes to the parent node
        for child in antScene.rootNode.childNodes {
            node.addChildNode(child)
        }
        
        
        // Add the node to the scene
        sceneView.scene.rootNode.addChildNode(node)
        
        
        
        
        
        
        // Set the scene to the view
//        sceneView.scene = scene
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
