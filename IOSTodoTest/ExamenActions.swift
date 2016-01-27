//
//  TestActions.swift
//  IOSTodoTest
//
//  Created by INFTEL 22 on 27/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation



class ExamenActions {
    var entity = "model.jpa.examen/"
    
    func getExamFromUser(dni: String, callback: (Examen) -> Void){ //Nombre test, duracion, tiempo del examen
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
       
        
        let httpPetition = HttpPetition(resource: entity+dni)
        var examen: Examen?
        httpPetition.httpGet({ (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if data != nil {
                let json = JSON(data: data!)
                examen = Examen(dni: json["DNI"].stringValue, id: json["id_test"].stringValue,
                    fecha: (dateFormatter.dateFromString(json["fecha"].stringValue))!, aciertos: Int(json["aciertos"].stringValue)!, fallos: Int(json["fallos"].stringValue)!, nota: Double(json["nota"].stringValue)!)
                callback(examen!)
                
            }
            
        })
    }

    
    }
