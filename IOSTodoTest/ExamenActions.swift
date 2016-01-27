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
    
    func getExamFromUser(dni: String, callback: ([Examen]) -> Void){ //Nombre test, duracion, tiempo del examen
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
       
        
        
        let httpPetition = HttpPetition(resource: entity+dni)
        var examen: Examen?
        httpPetition.httpGet({ (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            var arrayExamenes: [Examen] = [Examen]()

            if data != nil {
                
               
                    let json = JSON(data: data!)
                
                //If json is .Dictionary
                for (key,subjson):(String, JSON) in json {
                    //Do something you want
                    examen = Examen(dni: subjson["DNI"].stringValue, id: subjson["id_test"].stringValue,
                        fecha: (dateFormatter.dateFromString(subjson["fecha"].stringValue))!, aciertos: Int(subjson["aciertos"].stringValue)!, fallos: Int(subjson["fallos"].stringValue)!, nota: Double(subjson["nota"].stringValue)!)
                }
                
                    
                    arrayExamenes.append(examen!)
                    
                }
            
            print(arrayExamenes)

        callback(arrayExamenes)
            
        })
    }
}
