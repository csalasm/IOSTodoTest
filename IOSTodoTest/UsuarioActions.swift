//
//  UsuarioActions.swift
//  IOSTodoTest
//
//  Created by Carlos Salas on 26/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation

class UsuarioActions {
    var entity = "model.jpa.usuario/"
    
    func userAuth(user: String, callback: (Usuario) -> Void) {
        let httpPetition = HttpPetition(resource: entity+user)
        var usuario: Usuario?
        httpPetition.httpGet({ (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if data != nil {
                let json = JSON(data: data!)
                usuario = Usuario(nombre: json["nombre"].stringValue, apellidos: json["apellidos"].stringValue,
                    dni: json["dni"].stringValue, password: json["password"].stringValue)
                callback(usuario!)
                
            }

        })
    }
}