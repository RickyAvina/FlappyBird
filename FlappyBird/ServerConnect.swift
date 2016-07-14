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
//    var ScoreClass : BuiltClass?
//    var scoreObject : BuiltObject?
    
    var globalHighScore : Int?
    
    func initialize(){
        app = Built.applicationWithAPIKey("blt1c97ce4f38d2de63")
    }
    
    func postScore(highScore : Int){
        let ScoreClass = app!.classWithUID("scoredata")
        let scoreObject = ScoreClass!.object()
        scoreObject!["highscore"] = highScore
        scoreObject!.saveInBackgroundWithCompletion{(repsonseType: ResponseType, error: NSError!) -> Void in
            if (error == nil){
                print("Object Created Successfully")
            } else {
                print (error.userInfo)
            }
        }

    }
    
    func getGlobalHighScore() -> Int {
        var score = 0
        let ScoreClass = app!.classWithUID("scoredata")
        let projectQuery = ScoreClass!.query()
        projectQuery.orderByDescending("highscore")
        
        projectQuery.execInBackground{(responseType: ResponseType, result: QueryResult!, error: NSError!) -> Void in
            if (error == nil){
                print("Query executed successfully")
                let g = (result!.getResult()!)[0]
                score = (g["highscore"]!)! as! Int
                
            } else {
                print(error.userInfo)
            }
        }
        return score
    }
    
    func getAllScoresForUserWithUID(uid: String)-> [Int : NSDate] {
        return [0 : NSDate(), 349 : NSDate()]
    }
    
    
}