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
    var Fecha: NSDate
    var Aciertos: Int
    var Fallos: Int
    var Nota: Double
    
    init(dni: String, id: String, fecha: NSDate, aciertos: Int, fallos: Int, nota: Double) {
        self.DNI = dni
        self.ID_Test = id
        self.Fecha = fecha
        self.Aciertos = aciertos
        self.Fallos = fallos
        self.Nota = nota
    }
}
