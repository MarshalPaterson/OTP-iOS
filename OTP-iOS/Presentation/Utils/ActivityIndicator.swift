//
//  ActivityIndicator.swift
//  OTP-iOS
//
//  Created by Marshal Paterson on 18/3/20.
//  Copyright © 2020 marshal.paterson. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: View {
    
    @State private var degress = 0.0
    let color: Color
    let size: CGFloat
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(color, lineWidth: 5.0)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: degress))
            .onAppear{ self.start()}
    }
    
    func start() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.degress += 10.0
            }
            if self.degress == 360.0 {
                self.degress = 0.0
            }
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(color: Color.green, size: 80)
    }
}
