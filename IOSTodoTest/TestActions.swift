//
//  TestActions.swift
//  IOSTodoTest
//
//  Created by INFTEL 21 on 27/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation

class TestActions {
    var entity = "model.jpa.test/active/"
 
    
    func testAuth(user: String, callback: ([Test]) -> Void) {
        let httpPetition = HttpPetition(resource: entity+user)
         var test: Test?
         var testsArray:[Test] = [Test]()
        httpPetition.httpGet({ (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            let reply = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            //print(reply)
            if data != nil {
                let json = JSON(data: data!)
                for (key, subJson):(String, JSON) in json {
                    test = Test(nombre:subJson["nombre"].stringValue, idTest:CLong(subJson["idTest"].stringValue)!, duracion: subJson["duracion"].stringValue, resta: subJson["resta"].stringValue, activo: subJson["activo"].stringValue)
                    testsArray.append(test!)
                    
                      }
                   }
            
                callback(testsArray)
         
        })
    }
}