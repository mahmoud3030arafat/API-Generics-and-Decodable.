//
//  PostModel.swift
//  API Generics and Decodable
//
//  Created by Mahmoud on 9/11/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import Foundation
struct PostModel : Decodable{
    let us_erId : Int?
    let id : Int?
    let title : String?
    let body : String?
    
    private enum codingKeys:String,CodingKey{
        case  us_erId = " userId"
        case id = "id"
        case title  = "title"
        case body  = "body"
        
    }
    
}
