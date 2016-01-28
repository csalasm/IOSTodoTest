//
//  RespuestaActions.swift
//  IOSTodoTest
//
//  Created by Carlos Salas on 27/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation

class RespuestaActions{
    
    var entity = "model.jpa.respuesta/pregunta/"
    
    func getPregunta(idPregunta: String, callback: ([Answer]) -> Void){
        let httpPetition = HttpPetition(resource: entity+idPregunta)
        var respuestas: [Answer] = [Answer]()
        
        httpPetition.httpGet({ (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //let reply = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print(reply)
            if data != nil{
                let json = JSON(data:data!)
                for (_,subJSON):(String, JSON) in json {
                    let respuesta = Answer(id: subJSON["idRespuesta"].intValue, text: subJSON["texto"].stringValue, isCorrect: subJSON["correcta"].boolValue)
                    respuestas.append(respuesta)
                }
                callback(respuestas)
            }
        })
        
    }
    
}
