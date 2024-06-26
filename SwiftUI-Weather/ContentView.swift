//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ahmad Amjad on 24/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            backgroundColor(isNight: $isNight)
            VStack{
                weatherAppCity(cityName: "Islamabad,PK")
                weatherAppDayStatus(wIcon: isNight ? "cloud.moon.fill" : "cloud.sun.fill", temp: isNight ? "60°" : "76°")
                HStack(spacing: 10){
                    weatherDayUI(day: "TUE",image: "cloud.sun.fill",temp: "76°")
                    weatherDayUI(day: "WED",image: "cloud.sun.bolt.fill",temp: "66°")
                    weatherDayUI(day: "THU",image: "cloud.bolt.rain.fill",temp: "56°")
                    weatherDayUI(day: "FRI",image: "cloud.rainbow.half.fill",temp: "73°")
                    weatherDayUI(day: "SAT",image: "sun.haze.fill",temp: "60°")
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    buttonText(title: "Change Day Time",background: .white,foreground: .blue)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct weatherDayUI: View {
    var day:String!
    var image:String!
    var temp:String!
    
    var body: some View {
        VStack{
            Text(day)
                .foregroundStyle(.white)
                .bold()
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30,height: 30)
            Text(temp)
                .foregroundStyle(.white)
                .bold()
        }.padding()
    }
}

struct backgroundColor: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct weatherAppCity: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 35))
            .foregroundStyle(.white)
            .padding()
    }
}

struct weatherAppDayStatus: View {
    
    var wIcon: String
    var temp: String
    
    var body: some View {
        VStack{
            Image(systemName: wIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160,height: 160)
            Text(temp)
                .font(.system(size: 70))
                .foregroundStyle(.white)
        }
    }
}


