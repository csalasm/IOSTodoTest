//
//  Usuario.swift
//  IOSTodoTest
//
//  Created by Carlos Salas on 26/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation

class Usuario {
    var nombre: String
    var apellidos: String
    var dni: String
    var password: String
    
    init(nombre: String, apellidos: String, dni: String, password: String) {
        self.nombre = nombre
        self.apellidos = apellidos
        self.dni = dni
        self.password = password
    }
}
