//
//  Card.swift
//  Walme
//
//  Created by Dason Tiovino on 25/06/24.
//

import Foundation
import SwiftUI

struct Card<Content: View>: View {
    var fill: Color = .white
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
                    .fill(fill)
                    .stroke(.cardBorder, style: .init(
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
