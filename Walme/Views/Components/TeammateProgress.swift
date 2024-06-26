//
//  TeammateProgress.swift
//  Walme
//
//  Created by Dason Tiovino on 26/06/24.
//

import SwiftUI

struct TeammateProgress: View {
    @State private var notificationTriggered = false
    
    var user: User
    
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
                            notificationTriggered = true
                            Timer.scheduledTimer(withTimeInterval: TimeInterval(3), repeats: false){ time in
                                notificationTriggered = false
                            }
                        }){
                            Image(systemName: "bell.fill")
                                .foregroundStyle(notificationColor)
                        }
                        .alert(isPresented: $notificationTriggered, content: {
                            Alert(
                                title: Text("Notification Sent"),
                                message: Text("You remind \(user.nickname ?? "Rick") to finish the daily step")
                            )
                        })
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
