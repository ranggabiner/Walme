//
//  PersonalProgress.swift
//  Walme
//
//  Created by Dason Tiovino on 26/06/24.
//

import SwiftUI

extension Double {
    func formattedWithSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

struct PersonalProgress: View {
    var name: String;
    var step: Double;
    var total: Double = 2000;
    
    var body: some View {
        Card{
            VStack(alignment: .leading, spacing: 12){
                Text(name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                HStack{
                    Card(
                        fill: .personalCard,
                        alignment: Alignment(
                        horizontal: .center,
                        vertical: .center
                    )){
                        VStack{
                            Text("Current Steps")
                                .foregroundStyle(.white)
                            Text(step.formattedWithSeparator())
                                .font(.system(size: 32))
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }.frame(height: 50)
                    }
                    Card(
                        fill: .personalCard,
                        alignment: Alignment(
                        horizontal: .center,
                        vertical: .center
                    )){
                        VStack{
                            Text("Your Goal")
                                .foregroundStyle(.white)

                            Text(total.formattedWithSeparator())
                                .font(.system(size: 32))
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }.frame(height: 50)
                    }
                }
                
                ProgressBar(
                    value: step,
                    total: total
                )
            }
        }
    }
}

#Preview {
    PersonalProgress(name: "Rangga", step: 1175)
}
