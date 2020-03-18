//
//  RewardView.swift
//  OTP-iOS
//
//  Created by Marshal Paterson on 17/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import SwiftUI

struct RewardView: View {
    @Binding var showView : Bool
    var body: some View {
        VStack {
            HStack {
                Button(action:{self.showView = false}){
                    Image("left-arrow")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
                Text("Reward")
                Spacer()
            }.padding()
            LottieView(name: "1138-deer")
        }.navigationBarTitle(Text("Reward"), displayMode: .inline)
            .navigationBarHidden(true)
    }
}
