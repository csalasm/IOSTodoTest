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
    var examEntity = "model.jpa.examen"
    
    func getExamen(usuario: Usuario, callback: ([Examen]) -> Void){ //Nombre test, duracion, tiempo del examen
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSz"
       
        let httpPetition = HttpPetition(resource: entity+usuario.dni)
        var examen: Examen?
        httpPetition.httpGet({ (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            var arrayExamenes: [Examen] = [Examen]()

            if data != nil {
                //let reply = NSString(data: data!, encoding: NSUTF8StringEncoding)
                //print(reply)
                let json = JSON(data: data!)
                
                //If json is .Dictionary
                for (_,subjson):(String, JSON) in json {
                    //Do something you want
                    examen = Examen(dni: subjson["examenPk"]["dni"].stringValue, id: subjson["examenPK"]["idTest"].stringValue,
                        aciertos: Int(subjson["aciertos"].stringValue)!,
                        fallos: Int(subjson["fallos"].stringValue)!, nota: Double(subjson["nota"].stringValue)!, fecha: subjson["fecha"].stringValue, nombre: subjson["test"]["nombre"].stringValue)
                    
                        arrayExamenes.append(examen!)
                }
                //dateFormatter.dateFromString(subjson["fecha"].stringValue))
                }
            callback(arrayExamenes)
            
        })
    }
    
    func saveExamen(examen: Examen, callback: (Void) -> Void) {
        let httpPetition = HttpPetition(resource: examEntity)
        do {
            let jsonExamen = try NSJSONSerialization.dataWithJSONObject(examen.getInDictionary(), options: NSJSONWritingOptions.PrettyPrinted)
            let stringData = NSString(data: jsonExamen, encoding: NSUTF8StringEncoding)
            httpPetition.httpPost(stringData as! String, manageResponse: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                callback()
            })
        }catch let error as NSError{
            print(error.description)
        }

        
    }
}
