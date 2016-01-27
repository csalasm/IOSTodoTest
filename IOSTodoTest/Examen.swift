//
//  Examen.swift
//  IOSTodoTest
//
//  Created by INFTEL 22 on 27/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation


class Examen {
   
    var DNI: String
    var ID_Test: String
    var Aciertos: Int
    var Fallos: Int
    var Nota: Double
    var fecha: String
    var nombre: String
    
    init(dni: String, id: String,aciertos: Int, fallos: Int, nota: Double, fecha: String,nombre:String) {
        self.DNI = dni
        self.ID_Test = id
        self.Aciertos = aciertos
        self.Fallos = fallos
        self.Nota = nota
        self.fecha = fecha
        self.nombre = nombre
    }
}
