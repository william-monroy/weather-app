//
//  WeatherView.swift
//  WeatherApp
//
//  Created by William Frank Monroy Mamani on 19/02/24.
//

import SwiftUI

struct WeatherView: View {
    var weather:ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment:.leading, spacing: 5){
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
                
                HStack {
                    VStack(spacing:20){
                        Image(systemName: "sun.max")
                            .font(.system(size: 40))
                        
                        Text(weather.weather[0].main)
                    }
                    .frame(width: 150,alignment: .leading)
                    
                    Spacer()
                    
                    Text(weather.main.feels_like.roundDouble() + "°")
                        .font(.system(size:100))
                        .fontWeight(.bold)
                        .padding()
                }
                
//                Spacer()
//                    .frame(height: 80)
                
                AsyncImage(url: URL(string: "https://media.gettyimages.com/id/544061073/es/foto/city-hall-of-pamplona-spain.jpg?s=612x612&w=gi&k=20&c=oZq9yAVsOVo1ktOdrK-9qnWDhmrtk15DtMCB74Jrr4M=")){
                    image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:350)
                } placeholder: {
                    ProgressView()
                }
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack {
                Spacer()
                
                VStack(alignment:.leading, spacing: 20){
                    Text("Weather now")
                        .bold()
                        .font(.title2)
                        .padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.temp_min.roundDouble()+"°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.temp_max.roundDouble()+"°")
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble()+"m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble()+"%")
                    }
                }
                .frame(maxWidth: .infinity,alignment: .leading )
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.579, saturation: 0.912, brightness: 0.399))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft,.topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.579, saturation: 0.912, brightness: 0.399))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
