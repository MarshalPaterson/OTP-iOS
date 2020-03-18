//
//  RewardView.swift
//  OTP-iOS
//
//  Created by Marshal Paterson on 17/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import SwiftUI

struct RewardView: View {
    
    var body: some View {
        VStack {
            Text("Reward")
            LottieView(name: "1138-deer")
        }.navigationBarTitle(Text("Reward"), displayMode: .inline)
            .navigationBarHidden(true)
    }
}

struct RewardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardView()
    }
}
