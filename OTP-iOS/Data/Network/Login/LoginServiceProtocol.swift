//
//  LoginServiceProtocol.swift
//  OTP-iOS
//
//  Created by Marshal Paterson on 17/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import Foundation

protocol LoginServiceProtocol {
    func callAPI(completion: @escaping ([Result]?) -> Void)
}
