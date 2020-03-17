//
//  LoginViewModel.swift
//  OTP-iOS
//
//  Created by Marshal Paterson on 17/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var text = ""
    @Published var result = MovieList(results: [])
    @Published var loading = false
    let service: ServiceProtocol
    private var subCancellable: AnyCancellable!
    private var validCharSet = CharacterSet(charactersIn: "1234567890.")

    init(service: ServiceProtocol = APIService()) {
        subCancellable = $text.sink { val in
            //check if the new string contains any invalid characters
            if val.rangeOfCharacter(from: self.validCharSet.inverted) != nil {
                //clean the string (do this on the main thread to avoid overlapping with the current ContentView update cycle)
                DispatchQueue.main.async {
                    self.text = String(self.text.unicodeScalars.filter {
                        self.validCharSet.contains($0)
                    })
                }
            }
        }
    }

    deinit {
        subCancellable.cancel()
    }
    
    func callAPI() {
        self.loading = true
        service.postLogin { res in
            self.loading = false
            guard let res = res else {
                return
            }
            self.res.results = res
        }
    }
}
