//
//  AvatarPrompt.swift
//  Walme
//
//  Created by Rizki Maulana on 25/06/24.
//

import SwiftUI

enum ProgressPercentage {
    case progress0, progress25, progress50, progress75, progress100
}

struct TreeProgress: View {
    let clanName: String
    let progress: ProgressPercentage
    
    private func getImageName(progress: ProgressPercentage) -> String {
        switch progress {
        case .progress0:
            return "treeProgress0"
        case .progress25:
            return "treeProgress25"
        case .progress50:
            return "treeProgress50"
        case .progress75:
            return "treeProgress75"
        case .progress100:
            return "treeProgress100"
        }
    }
    
    var body: some View {
        Card {
            VStack(alignment:.leading, spacing: 0){
                Text("\(clanName)'s Tree")
                    .fontWeight(.semibold)
                    .padding(.bottom, UIConfig.Paddings.large)
                Image(getImageName(progress: progress))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            
            }
        }
        
    }
}

#Preview {
    TreeProgress(clanName: "Six Nakama", progress: ProgressPercentage.progress0)
}
