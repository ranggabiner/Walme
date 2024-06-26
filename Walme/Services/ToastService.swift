//
//  ToastService.swift
//  Walme
//
//  Created by Dason Tiovino on 27/06/24.
//

import Foundation
import SwiftUI
import Combine

class ToastService: ObservableObject {
    @Published var isShowing = false
    var content: AnyView = AnyView(EmptyView())
    
    func show<Content: View>(content: Content, duration: TimeInterval = 2) {
        self.content = AnyView(content)
        withAnimation {
            self.isShowing = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            withAnimation {
                self.isShowing = false
            }
        }
    }
}
