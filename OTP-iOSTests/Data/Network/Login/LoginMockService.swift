//
//  LoginMockService.swift
//  OTP-iOSTests
//
//  Created by Marshal Paterson on 18/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import Foundation
@testable import OTP_iOS

class LoginMockService : LoginServiceProtocol {
    func callLoginApi(search: String, completion: @escaping (Login?) -> Void) {
        completion(mockData)
    }
    
    let mockData: Login?
    
    init(mockData: Login?) {
        self.mockData = mockData
    }
}
