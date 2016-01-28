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
    var duracion: String
    var resta: String
    var idTest: Int
    var arrayQuestions: [Question]? //Array de preguntas
    
    //Mark: Init
    
    init(nombre:String,idTest:CLong,duracion :String,resta :String,activo:String){
        
         self.idTest = idTest
         self.name = nombre
         self.duracion = duracion
         self.resta = resta
       
       
        }
}