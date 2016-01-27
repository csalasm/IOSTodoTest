//
//  Pregunta.swift
//  IOSTodoTest
//
//  Created by INFTEL 23 on 22/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//


import UIKit


class Question {
    
    //MARK: Properties
    
    var text: String
    var arrayAnswers: [Answer]?
    var image: UIImage?
    var idPreg: Int
    
    
    /*init?(text:String,arrayAnswers:[Answer],image:UIImage?){
        self.text = text
        self.arrayAnswers = arrayAnswers
        self.image = image
    }*/

    init?(text:String,idPreg:Int){
        self.text = text
        self.idPreg = idPreg
    }
    
}