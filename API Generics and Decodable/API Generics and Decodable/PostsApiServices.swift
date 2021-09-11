//
//  PostsApiServices.swift
//  API Generics and Decodable
//
//  Created by Mahmoud on 9/11/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import Foundation

 import  Alamofire
class PostsApiServices {
    
    static let shared = PostsApiServices()
      private init() {}
    
    func getData<T:Decodable,C:Decodable>(url:String,completion:@escaping([T]?,[C]?,Error?)->()){
        Alamofire.request(url).responseJSON { (response) in
            guard let data  = response.data else {return}
            switch response.result{
            case .success( let values ):
                do{
                   let post  = try JSONDecoder().decode([T]?.self, from: data)
                   let comment  = try JSONDecoder().decode([C]?.self, from: data)
                    completion(post,comment,nil)
                }catch let error {
                    
                    print(error)
                    
                }
                
                
            case .failure(let error):
               
                completion(nil,nil,error)
    
                
            }
        }
        
        
        
    }
    
    
}
