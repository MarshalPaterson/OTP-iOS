//
//  LoginView.swift
//  OTP-iOS
//
//  Created by Marshal Paterson on 17/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Please enter \nyour OTP")
                .font(.system(size: 52))
                .bold()
                .multilineTextAlignment(.center)
            HStack {
                SecureField("", text: $loginViewModel.text)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
            Button(action: {
                print("Delete button tapped!")
            }) {
                Image("search")
                    .font(.largeTitle)
            }}
            Spacer()
            Spacer()
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
