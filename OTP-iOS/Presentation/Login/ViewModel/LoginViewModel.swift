//
//  LoginViewModel.swift
//  OTP-iOS
//
//  Created by Marshal Paterson on 17/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var otpText = ""
    @Published var loginResult = Login(status: "")
    @Published var loading = false
    @Published var isLoggedIn = false
    
    let service: LoginServiceProtocol
    
    init(service: LoginServiceProtocol = LoginService()) {
        self.service = service        
    }
    
    func callLoginAPI() {
        self.loading = true
        self.service.callLoginApi(search: self.otpText) { res in            
            if res?.status == "ok" {
                self.isLoggedIn = true
                self.loginResult.status = ""
            } else {
                self.loginResult.status = "Failed to login, please try again."
            }
            self.loading = false
        }
        
    }
}
