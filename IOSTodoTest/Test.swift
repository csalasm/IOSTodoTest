//
//  Test.swift
//  IOSTodoTest
//
//  Created by INFTEL 23 on 22/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation


class Test{
    
    //Mark: Properties
    
    var name:String
    var time:Int
    var tipo:String
    var fecha: NSDate
    var arrayAnswers: [Answer]? //Array de preguntas
    
    //Mark: Init
    
    init(name:String){
        self.name = name
        self.time = 0
        self.tipo = "No asignado"
        
        }
}