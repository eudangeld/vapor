//
//  viewController.swift
//  App
//
//  Created by dan on 26/03/19.
//

import Foundation
import Vapor

final class ViewController{
    func view(_ req: Request)throws -> Future<View>  {
        let data = ["name": "Ethan", "age": "26"]
        return try req.view().render("welcome",data)
    }
}

