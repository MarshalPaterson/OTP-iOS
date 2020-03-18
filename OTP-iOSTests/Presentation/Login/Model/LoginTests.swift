//
//  LoginTests.swift
//  OTP-iOSTests
//
//  Created by Marshal Paterson on 18/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import XCTest
@testable import OTP_iOS

class LoginTests: XCTestCase {

    func testSuccessParser() {
        let json = """
        {
            "status": "ok",
        }
        """.data(using: .utf8)!
        
        let login = try! JSONDecoder().decode(Login.self, from: json)
        
        XCTAssertNotNil(login)
        XCTAssertEqual(login.status, LoginMock.mock(status: "ok").status)
    }

}
