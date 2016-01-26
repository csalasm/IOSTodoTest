//
//  Result.swift
//  IOSTodoTest
//
//  Created by INFTEL 22 on 26/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation

class Result{
    
    //Mark: Properties
    var nameTest:String!
    var Date: NSDate?
    var successes: Int?
    var failures: Int?
    var score: Int?
    
    //Mark: Init
    
    init(name:String){
        self.nameTest = name
        self.failures = 4
        self.successes = 7
        self.score = 6
        self.Date = NSDate()
            }
 
}