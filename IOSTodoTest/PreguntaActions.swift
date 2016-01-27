//
//  PreguntaActions.swift
//  IOSTodoTest
//
//  Created by INFTEL 23 on 27/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation

class PreguntaActions{
    
    var entity = "model.jpa.pregunta/"
    
    func getPregunta(idTest: String, callback: ([Question]) -> Void){
        let httpPetition = HttpPetition(resource: entity+idTest)
        var pregunta: Question?
        var preguntas: [Question]?
        
        httpPetition.httpGet({ (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
        if data != nil{
            let json = JSON(data:data!)
            pregunta = Question(text: json["texto"].stringValue, idPreg: json["idPregunta"].intValue)
            
            //var i = json.count
            
            
            for (i,subJson):(String, JSON) in json {
                print(subJson[i]["texto"])
            }
            
            callback(preguntas!)
        }
    })
    
}
    
}


