//
//  HomeHeader.swift
//  Walme
//
//  Created by Rizki Maulana on 25/06/24.
//

import SwiftUI

struct HomeHeader: View {
    let name: String
    let date: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Hi, \(name)")
                .font(.title3)
                .fontWeight(.semibold)
            Text(date)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(Color.gray)
            
        }
    }
}

#Preview {
    HomeHeader(
        name: "Rizki",
        date: "Tuesday, 11 August 2023"
    )
}
