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
    init(dni: String, id: String,aciertos: Int, fallos: Int, nota: Double, fecha: String) {
        self.DNI = dni
        self.ID_Test = id
        self.Aciertos = aciertos
        self.Fallos = fallos
        self.Nota = nota
        self.fecha = fecha
    }
    
    func getInDictionary() -> NSDictionary {
        let dic = ["examenPK": ["dni": self.DNI, "idTest": self.ID_Test],
                    "aciertos": String(self.Aciertos), "fallos": String(self.Fallos), "nota": String(self.Nota), "fecha": self.fecha
        ]
        return dic
    }
}
