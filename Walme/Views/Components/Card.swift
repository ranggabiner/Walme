//
//  Card.swift
//  Walme
//
//  Created by Dason Tiovino on 25/06/24.
//

import Foundation
import SwiftUI

struct Card<Content: View>: View {
    var fillColor: Color = .white
    var strokeColor: Color = .cardBorder
    var lineWidth: Double = 2
    var radius: Double = 24
    
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
                RoundedRectangle(cornerRadius: radius)
                    .fill(fillColor)
                    .stroke(strokeColor, style: .init(
                        lineWidth: lineWidth
                    ))
            }
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
