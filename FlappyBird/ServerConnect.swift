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
    
    var app: BuiltApplication?

    func initialize(){
        app = Built.applicationWithAPIKey("blt1c97ce4f38d2de63")
    }
    
    func postScore(highScore : Int){
        let ScoreClass = app!.classWithUID("ScoreData")
        let scoreObject = ScoreClass.object()
        scoreObject["username"] = "TestUser"
        scoreObject["score"] = 4
        scoreObject["highScore"] = highScore
        
        scoreObject.saveInBackgroundWithCompletion{(repsonseType: ResponseType, error: NSError!) -> Void in
            if (error == nil){
                
            } else {
                print (error.userInfo)
            }
            
        }
    }
    
    func  getHighScoreForUser(uid: String) -> Int {
        var score : Int = 0
        // get score for the use from Built using Query
        // score = HS
        return score
    }
    
    func getAllScoresForUserWithUID(uid: String)-> [Int : NSDate] {
        return [0 : NSDate(), 349 : NSDate()]
    }
    
    
}