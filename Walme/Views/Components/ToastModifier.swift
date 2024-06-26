//
//  ToastModifier.swift
//  Walme
//
//  Created by Dason Tiovino on 27/06/24.
//

import Foundation
import SwiftUI

struct ToastModifier: ViewModifier {
    @ObservedObject var service: ToastService
    
    func body(content: Content) -> some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)){
            content
            if service.isShowing {
                service.content
                    .padding()
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2),radius: 5)
                    .transition(.opacity)
                    .zIndex(1)
                // Adjust position as needed
            }
        }
    }
}

extension View {
    func toast(service: ToastService) -> some View {
        self.modifier(ToastModifier(service: service))
    }
}
