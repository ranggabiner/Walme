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
    
    private var isCompleted: Bool{
        return step >= total
    }
    
    var body: some View {
        Card{
            VStack(alignment: .leading, spacing: 12){
                Text(name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                HStack{
                    Card(
                        fillColor: isCompleted ? .completed : .personalCard,
                        alignment: Alignment(
                        horizontal: .center,
                        vertical: .center
                    )){
                        VStack{
                            Text("Current Steps")
                                .foregroundStyle(.white)
                            
                            Text( isCompleted ? "Completed" : step.formattedWithSeparator())
                                .font(.system(size: 28))
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }.frame(height: 50)
                    }
                    Card(
                        fillColor: isCompleted ? .completed : .personalCard,
                        alignment: Alignment(
                        horizontal: .center,
                        vertical: .center
                    )){
                        VStack{
                            Text("Your Goal")
                                .foregroundStyle(.white)

                            Text(total.formattedWithSeparator())
                                .font(.system(size: 28))
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }.frame(height: 50)
                    }
                }
                
                ProgressBar(
                    value: step,
                    total: total,
                    progressColor: isCompleted ? .completed : .personalProgressColor1,
                    progressDecorationColor: isCompleted ? .completedAccent : .personalProgressColor2
                )
            }
        }
    }
}

#Preview {
    PersonalProgress(name: "Rangga", step: 2000)
}
