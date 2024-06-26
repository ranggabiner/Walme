//
//  TeammateProgress.swift
//  Walme
//
//  Created by Dason Tiovino on 26/06/24.
//

import SwiftUI

struct TeammateProgress: View {
    @EnvironmentObject var toastService: ToastService
    var user: User
    
    private var notificationColor: Color{
        if(Double(user.dailyStep!) ?? 0 >= Double(user.dailyStepGoals!) ?? 2000){
            return .inactiveNotification
        }else{
            return .activeNotification
        }
    }
    
    private var isCompleted: Bool{
        return Double(user.dailyStep ?? "0.0")! >= Double(user.dailyStepGoals ?? "2000.0")!
    }
    
    var body: some View {
        Card{
            VStack(alignment: .leading){
                HStack(){
                    Text(user.nickname ?? "Rizki")
                    Spacer()
                    if(isCompleted){
                        Text("Completed")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }else{
                        Button(action: {
                            toastService.show(content:Card(
                                fillColor: .toastFill,
                                strokeColor: .toastFill
                            ){
                                HStack{
                                    Image(systemName: "checkmark.circle")
                                    VStack(alignment: .leading){
                                        Text("Success")
                                        Text("You remind \(user.nickname ?? "Rizki") to finish the daily step")
                                            .font(.caption)
                                    }
                                }
                            })
                        }){
                            Image(systemName: "bell.fill")
                                .foregroundStyle(notificationColor)
                        }
                    }
                   
                    
                }
                
                ProgressBar(
                    value: Double(user.dailyStep!) ?? 0.0,
                    total: Double(user.dailyStepGoals!) ?? 0.0,
                    height: 24,
                    progressColor: isCompleted ? .completed : .personalProgressColor1,
                    progressDecorationColor: isCompleted ? .completedAccent : .personalProgressColor2
                )
            }
        }
    }
}

#Preview {
    TeammateProgress(user: User(
        id: UUID().uuidString,
        email: "rizki@gmail.com",
        nickname: "Rizki",
        dailyStepGoals: "2000",
        dailyStep: "1000",
        isCompleted: false
    ))
}
