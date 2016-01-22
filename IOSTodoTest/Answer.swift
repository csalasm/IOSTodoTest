//
//  Answer.swift
//  IOSTodoTest
//
//  Created by INFTEL 23 on 22/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation


class Answer{
    
    //Mark: Properties
    var text:String
    var isCorrect:Bool
    
    init(text:String,isCorrect: Bool){
        self.text = text
        self.isCorrect = isCorrect
    }

}