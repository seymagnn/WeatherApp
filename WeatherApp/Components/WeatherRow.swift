//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by Seyma Gunonu on 26.12.2024.
//

import SwiftUI

struct WeatherRow: View {
    var logo : String
    var name : String
    var value : String
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20,height: 20)
                .padding()
                .background(.gray.opacity(0.4))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8){
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
        
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "Feels Like", value: "6°")
}
