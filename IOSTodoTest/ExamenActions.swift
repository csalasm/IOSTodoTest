//
//  TestActions.swift
//  IOSTodoTest
//
//  Created by INFTEL 22 on 27/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation



class ExamenActions {
    var entity = "model.jpa.usuario/examen/"
    
    func getExamen(usuario: Usuario, callback: ([Examen]) -> Void){ //Nombre test, duracion, tiempo del examen
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSz"
       
        let httpPetition = HttpPetition(resource: entity+usuario.dni)
        var examen: Examen?
        httpPetition.httpGet({ (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            var arrayExamenes: [Examen] = [Examen]()

            if data != nil {
                
                
                let reply = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(reply)
                let json = JSON(data: data!)
                
                //If json is .Dictionary
                for (key,subjson):(String, JSON) in json {
                    //Do something you want
                    examen = Examen(dni: subjson["examenPk"]["dni"].stringValue, id: subjson["examenPK"]["idTest"].stringValue,
                        aciertos: Int(subjson["aciertos"].stringValue)!,
                        fallos: Int(subjson["fallos"].stringValue)!, nota: Double(subjson["nota"].stringValue)!, fecha: subjson["fecha"].stringValue)
                    print(examen?.ID_Test)
                        arrayExamenes.append(examen!)
                }
                //dateFormatter.dateFromString(subjson["fecha"].stringValue))
                    
                
         
                
                }
            for examen in arrayExamenes{
                
                print(examen.ID_Test)
                print(examen.fecha)
                
            }
            

        callback(arrayExamenes)
            
        })
    }
}
