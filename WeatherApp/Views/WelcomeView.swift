//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by William Frank Monroy Mamani on 19/02/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome to WeatherApp")
                    .bold().font(.title)
                
                Text("Please, share your current location to get the weather in your area")
            }.multilineTextAlignment(.center)
                .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }.cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    WelcomeView()
}
