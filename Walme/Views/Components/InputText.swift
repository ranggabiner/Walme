//
//  InputText.swift
//  Walme
//
//  Created by robert theo on 20/06/24.
//

import SwiftUI

struct InputText: View {
    var textField: String
    @Binding var field: String
    var showError: Bool
    var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading) {
            TextField("", text: $field, prompt: Text(textField))
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(showError ? Color.red : Color.gray, lineWidth: 1)
                )
                .overlay(
                    Image(systemName: Strings.PersonalizeGoal.iconError)
                        .foregroundColor(Color.red)
                        .padding(UIConfig.Paddings.large)
                        .opacity(showError ? 1 : 0),
                    alignment: .trailing
                )

            if showError, let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundColor(.red)
                    .padding(.leading)
            }
        }
    }
}

struct InputText_Previews: PreviewProvider {
    @State static var field: String = ""
    static var textField: String = Strings.PersonalizeGoal.nickName

    static var previews: some View {
        InputText(textField: textField, field: $field, showError: true, errorMessage: Strings.PersonalizeGoal.nicknameError)
    }
}
