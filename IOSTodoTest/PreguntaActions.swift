//
//  PreguntaActions.swift
//  IOSTodoTest
//
//  Created by INFTEL 23 on 27/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation

class PreguntaActions{
    
    var entity = "model.jpa.pregunta/test/"
    
    func getPregunta(idTest: String, callback: ([Question]) -> Void){
        let httpPetition = HttpPetition(resource: entity+idTest)
        var preguntas: [Question] = [Question]()
        
        httpPetition.httpGet({ (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //let reply = NSString(data: data!, encoding: NSUTF8StringEncoding)
        if data != nil{
            let json = JSON(data:data!)
            //var i = json.count
            for (i,subJSON):(String, JSON) in json {
                let pregunta = Question(text: subJSON["texto"].stringValue, idPreg: subJSON["idPregunta"].intValue, arrayAnswer: nil, image: subJSON["imagen"].stringValue)
                preguntas.append(pregunta!)
            }
            callback(preguntas)
        }
    })
    
}
    
}


