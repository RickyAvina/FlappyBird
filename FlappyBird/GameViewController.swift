//
//  GameViewController.swift
//  FlappyBird
//
//  Created by Maricela Avina on 7/12/16.
//  Copyright (c) 2016 RickyAvina. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    private var hs = 0
    var highScore : Int {
        set {
            hs = newValue
            ServerConnect.sharedInstance.postScore(newValue)
        }
        
        get {
            return hs
        }
    }
    
    func gameOverWithScore(score : Int){
        if (score > highScore){
            highScore = score
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            scene.size = self.view.bounds.size
            
            skView.presentScene(scene)
            
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
