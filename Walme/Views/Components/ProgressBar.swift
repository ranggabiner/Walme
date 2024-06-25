//
//  ProgressBar.swift
//  Walme
//
//  Created by Dason Tiovino on 24/06/24.
//

import Foundation
import SwiftUI

struct ProgressBar: View {
    var value:Double = 1000;
    var total:Double = 2000;
    var height: Double = 40;
    
    var body: some View {
        GeometryReader{geometry in
            ZStack(alignment: .leading){
                Capsule()
                    .fill(.white)
                    .stroke(.finishedColor1, lineWidth: 2)
                
                if (value < 250) {
                    Capsule()
                        .fill(.personalProgressColor1)
                        .frame(width: 250/total * geometry.size.width)
                        .overlay{
                            Capsule()
                                .fill(.personalProgressColor2)
                                .frame(
                                    width: 250/total * geometry.size.width / 2.5,
                                    height: height / 2.5
                                )
                                .offset(
                                    x: 250/total * (geometry.size.width / -8) - height/8,
                                    y: height / -8
                                )
                        }
                } else {
                    Capsule()
                        .fill(.personalProgressColor1)
                        .frame(width: value <= total ? value/total * geometry.size.width : geometry.size.width)
                        .overlay{
                            Capsule()
                                .fill(.personalProgressColor2)
                                .frame(
                                    width: value <= total ? value/total * geometry.size.width / 2.5 : geometry.size
                                        .width / 2.5,
                                    height: height / 2.5
                                )
                                .offset(
                                    x: (value/total * (geometry.size.width / -6) - height / 8),
                                    y: height / -8
                                )
                        }
                }
            }
        }
        .frame(height: height)
        .padding()
    }
}

#Preview {
    ProgressBar()
}