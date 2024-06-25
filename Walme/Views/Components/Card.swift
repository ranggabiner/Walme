//
//  Card.swift
//  Walme
//
//  Created by Dason Tiovino on 25/06/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

struct Card<Content: View>: View {
    var alignment: Alignment = Alignment(horizontal: .leading, vertical: .top)
    @ViewBuilder let content: Content
    
    var body: some View {
        content
            .padding()
            .frame(
                maxWidth: .infinity,
                alignment: alignment
            )
            .background{
                RoundedRectangle(cornerRadius: 24)
                    .fill(.white)
                    .stroke(Color(hex: 0xF1F1F1), style: .init(
                        lineWidth: 2
                    ))
            }.padding()
    }
}

#Preview {
    VStack{
        Card{
            Text("TEST")
        }
        Card{
            Text("TEST")
        }
        Card{
            Text("TEST")
        }
    }.padding()
}
