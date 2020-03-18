//
//  LoginViewModelTests.swift
//  OTP-iOSTests
//
//  Created by Marshal Paterson on 18/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import XCTest
@testable import OTP_iOS

class LoginViewModelTests: XCTestCase {
    
    func testSuccessFetchData() {
        let expected = LoginMock.mock(status: "ok")
        let service = LoginMockService(mockData: expected)
        
        let viewModel = LoginViewModel(service: service)
        viewModel.otpText = "1234"
        
        XCTAssertEqual(viewModel.otpText, "1234")
        
        viewModel.callLoginAPI()
        
        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.isLoggedIn, true)
    }
    
    func testEmptyData() {
        let expected = LoginMock.mock(status: "error")
        let service = LoginMockService(mockData: expected)

        let viewModel = LoginViewModel(service: service)
        viewModel.otpText = "11111"
        
        viewModel.callLoginAPI()

        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.loginResult.status, "Failed to login, please try again.")
        XCTAssertEqual(viewModel.isLoggedIn, false)
    }
}
