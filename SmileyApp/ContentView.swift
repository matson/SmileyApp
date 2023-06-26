//
//  ContentView.swift
//  SmileyApp
//
//  Created by Tracy Adams on 6/24/23.
//

import SwiftUI

struct ContentView: View {
    
    //alien head
    struct AlienHead: Shape {
        func path(in rect: CGRect)-> Path{
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                              control: CGPoint(x: rect.minX, y: rect.minY))
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY),
                              control: CGPoint(x: rect.maxX, y: rect.minY))
            
            return path
            
        }
    }
    
    
    //gradient Colors:
    static let gradientEye1Start = Color(red: 85.0 / 255, green: 30.0 / 255, blue: 221.0 / 255)
    static let gradientEye1End = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    static let gradientFaceStart = Color(red: 66.0 / 255, green: 148.0 / 255, blue: 68.0 / 255)
    static let gradientFaceEnd = Color(red: 14.0 / 255, green: 47.0 / 255, blue: 120.0 / 255)
    
    static let gradientEye2Start = Color(red: 198.0 / 255, green: 12.0 / 255, blue: 198.0 / 255)
    static let gradientEye2End = Color(red: 49.0 / 255, green: 205.0 / 255, blue: 196.0 / 255)
    
    
    
    var body: some View {
        ZStack {
            AlienHead()
                .fill(LinearGradient(
                    gradient: .init(colors: [Self.gradientFaceStart, Self.gradientFaceEnd]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
                  ))
                .frame(width: 600, height: 560)
            VStack{
                
                //eyes
                HStack{
                    Ellipse()
                        .fill(LinearGradient(
                            gradient: .init(colors: [Self.gradientEye1Start, Self.gradientEye1End]),
                            startPoint: .init(x: 0.5, y: 0),
                            endPoint: .init(x: 0.8, y: 0.6)
                        ))
                        .frame(width: 110, height: 60)
                        .rotationEffect(Angle(degrees: 40))
                    //Spacing
                    Spacer()
                        .frame(width: 30)
                    
                    Ellipse()
                        .fill(LinearGradient(
                            gradient: .init(colors: [Self.gradientEye2Start, Self.gradientEye2End]),
                            startPoint: .init(x: 0.5, y: 0),
                            endPoint: .init(x: 0.8, y: 0.6)
                        ))
                        .frame(width: 110, height: 60)
                        .rotationEffect(Angle(degrees: 140))
                }
                
                Spacer()
                    .frame(height: 40)
                
                //nose
                HStack{
                    
                    Circle()
                        .frame(width: 10, height: 10)
                    
                    Circle()
                        .frame(width: 10, height: 10)
                }
                //mouth
                HStack{
                    Circle()
                        .trim(from: 0.5, to: 1.0)
                        .rotationEffect(Angle(degrees: 180))
                        .frame(width: 200, height: 125)
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .background(
            Image("space")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

