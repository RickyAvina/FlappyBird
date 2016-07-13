//
//  ServerConnect.swift
//  FlappyBird
//
//  Created by Maricela Avina on 7/13/16.
//  Copyright © 2016 RickyAvina. All rights reserved.
//

import Foundation

class ServerConnect{
    static let sharedInstance = ServerConnect()
    
    var app : BuiltApplication?
    var ScoreClass : BuiltClass?
    var scoreObject : BuiltObject?
    
    func initialize(){
        app = Built.applicationWithAPIKey("blt1c97ce4f38d2de63")
        ScoreClass = app?.classWithUID("ScoreData")
        scoreObject = ScoreClass?.object()
    }
    
    func sendScore(username username: String, score: Int, highScore: Int){
        scoreObject!["username"] = username
        scoreObject!["score"] = score
        scoreObject!["highScore"] = highScore
        
        scoreObject?.saveInBackgroundWithCompletion{(responseType: ResponseType, error: NSError!) -> Void in
            if (error == nil){
                // created successfully
                print("Object created successfully!")
            } else {
                // error
                print("Not created successfully")
                print(error.userInfo)
            }
            
            }
    }
}