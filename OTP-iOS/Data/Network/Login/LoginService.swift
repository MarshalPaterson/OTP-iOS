//
//  LoginService.swift
//  OTP-iOS
//
//  Created by Marshal Paterson on 17/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import Foundation

class LoginService : LoginServiceProtocol {
    func callLoginApi(search: String, completion: @escaping (Login?) -> Void) {
        loadData(search: search, completion: completion)
    }
    
    private func loadData(search: String, completion: @escaping (Login?) -> Void) {
        guard let url = URL(string: "http://floral-cherry-7673.getsandbox.com/login") else { return }
        
        let parameters = ["code": "1234"]

        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request){ (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let result = try? JSONDecoder().decode(Login.self, from: data) else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }
}
