//
//  LoginMock.swift
//  OTP-iOSTests
//
//  Created by Marshal Paterson on 18/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import Foundation
@testable import OTP_iOS

class LoginMock {
    static func mock(status:String) -> Login {
        return Login(status: status)
    }
}
