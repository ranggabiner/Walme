//
//  ButtonAction.swift
//  Walme
//
//  Created by Rangga Biner on 21/06/24.
//

import SwiftUI

struct ButtonAction: View {
    enum ButtonWidth {
        case long, short
    }

    enum ButtonImage {
        case none
        case system(name: String)
        case custom(Image)
    }
    
    var buttonText: String
    var textColor: Color
    var rectanglePrimaryColor: Color
    var rectangleSecondaryColor: Color
    var strokeColor: Color
    var buttonWidth: ButtonWidth
    var action: () -> Void
    var buttonImage: ButtonImage
    
    @State private var isPressed: Bool = false
    
    private func buttonFrameWidth(screenWidth: CGFloat) -> CGFloat {
        switch buttonWidth {
        case .long:
            return screenWidth
        case .short:
            return screenWidth / 2
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                action()
            }) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: buttonFrameWidth(screenWidth: geometry.size.width), height: 48)
                        .background(rectanglePrimaryColor)
                        .cornerRadius(48)
                        .overlay(
                            RoundedRectangle(cornerRadius: 48)
                                .inset(by: -1)
                                .stroke(strokeColor, lineWidth: 2)
                        )
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25),
                            radius: 4,
                            y: 4
                        )
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: buttonFrameWidth(screenWidth: geometry.size.width) - 20, height: 24)
                        .background(rectangleSecondaryColor)
                        .cornerRadius(56)
                        .offset(y: -10)
                    HStack(spacing: 8) {
                        switch buttonImage {
                        case .none:
                            EmptyView()
                        case .system(let name):
                            Image(systemName: name)
                                .foregroundColor(textColor)
                        case .custom(let image):
                            image
                                .foregroundColor(textColor)
                        }
                        Text(buttonText)
                            .font(.system(size: 16, weight: .semibold))
                            .lineSpacing(24)
                            .foregroundColor(textColor)
                    }
                }
                .frame(width: buttonFrameWidth(screenWidth: geometry.size.width), height: 48)
                .scaleEffect(isPressed ? 0.95 : 1.0)
            }
            .buttonStyle(PlainButtonStyle())
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        withAnimation(.easeIn(duration: 0.2)) {
                            isPressed = true
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.easeOut(duration: 0.2)) {
                            isPressed = false
                        }
                    }
            )
        }
        .frame(height: 48)
    }
}

#Preview {
    VStack(spacing: 20) {
        ButtonAction(
            buttonText: "Join Clan",
            textColor: .white,
            rectanglePrimaryColor: Color(red: 0.92, green: 0.69, blue: 0.17),
            rectangleSecondaryColor: Color(red: 1, green: 0.75, blue: 0.19),
            strokeColor: .white,
            buttonWidth: .long,
            action: { print("Button Clicked!") },
            buttonImage: .system(name: "applelogo")
        )
    }
    .padding()
}
