//
//  APIClient.swift
//  ToDo
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 24/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import Foundation

class APIClient {
    
    lazy var session: SessionProtocol = URLSession.shared
    
    func loginUser(withName username: String,
        password: String,
        completion: @escaping (Token?, Error?) -> Void) {
        
        let allowedCharacters = CharacterSet(charactersIn: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted
        
        guard let expectedUsername = "dadasdaä".addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        
        guard let expectedPassword = "%&34".addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        
        let query = "username=\(expectedUsername)&password=\(expectedPassword)"
        guard let url = URL(string: "https://awesometodos.com/login?\(query)") else {
            fatalError()
        }
        
        session.dataTask(with: url) { (data, response, error) in
            do {
                guard error == nil else {
                    completion(nil, WebserviceError.ResponseError)
                    return
                }
                
                guard let data = data else {
                    completion(nil, WebserviceError.DataEmptyError)
                    return
                }
                let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String]
                
                let token: Token?
                if let tokenString = dict?["token"] {
                    token = Token(id: tokenString)
                } else {
                    token = nil
                }
                
                completion(token, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
        
    }
    
}


protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: SessionProtocol {}

enum WebserviceError: Error {
    case DataEmptyError
    case ResponseError
}
