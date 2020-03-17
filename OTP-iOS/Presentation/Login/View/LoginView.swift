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
        NavigationView {
            VStack {
                if loginViewModel.loading {
                    ActivityIndicator(color: Color.blue, size: 50)
                } else {
                    Spacer()
                    Text("Please enter \nyour OTP")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    HStack {
                        SecureField("", text: $loginViewModel.otpText)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.oneTimeCode)
                            .keyboardType(.numberPad)
                        NavigationLink(destination: RewardView(), isActive: self.$loginViewModel.isLoggedIn) {
                            Button(action: {
                                print("Delete button tapped!")
                                self.loginViewModel.isLoggedIn = false
                                self.loginViewModel.callLoginAPI()
                            }) {
                                Image("search")
                                    .font(.largeTitle)
                            }}}
                    Text(loginViewModel.loginResult.status)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Color.red)
                    Spacer()
                    Spacer()
                }}.padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
