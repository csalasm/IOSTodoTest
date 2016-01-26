//
//  HttpPetition.swift
//  IOSTodoTest
//
//  Created by Carlos Salas on 26/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation

class HttpPetition {
    var host = "http://localhost"
    var port = "8080"
    var path = "TodoTestWebWH/webresources/"
    var url:NSURL?
    
    
    init(resource: String) {
        url = NSURL(string: host+":"+port+"/"+path+resource)
    }
    
    func httpGet(manageResponse: (NSData?, NSURLResponse?, NSError?) -> Void) {
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: manageResponse)
        task.resume()

    }
    
    func httpPost(manageResponse: (NSData?, NSURLResponse?, NSError?) -> Void) {
        let request = NSURLRequest(URL: url!)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: manageResponse)
        task.resume()
    }
}
