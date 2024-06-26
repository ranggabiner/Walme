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
                    .fill(fillColor)
                    .stroke(strokeColor, style: .init(
                        lineWidth: 2
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
