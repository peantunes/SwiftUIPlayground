//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 17/04/2021.
//

import SwiftUI

private struct Rocket: Identifiable {
    let id = UUID()
    let point: CGPoint
}
struct ContentView: View {
    @State var changeShadow: Bool = false
    @State var glowing: Bool = false
    @State private var rockets: [Rocket] = []
    @State var lastLocation: CGPoint = .zero
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("earth")
                    .clipped()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                    .blur(radius: 10)
                //                .offset(x: 0, y: 200)
                VStack {
                    HStack {
                        Text("🌕 ")
                            .xxlText(2)
                            .glowInTheDark()
                            .padding()
                        
                        .onTapGesture {
                            rockets = []
                        }
                        
                        Spacer()
                    }
                    ZStack {
                        Text("☁️")
                            .xxlText(6)
                            //                    .glowInTheDark()
                            .offset(y: 100)
                        
                    }
                    Spacer()
                }
                
                ForEach(rockets) { rocket in
                    rocketBuild(rocket)
                }
            }
            
            .impressMe(color: Color(.black))
            
            .gesture(TapGesture(count: 1)
                        .onEnded {
                            rockets.append(Rocket(point: lastLocation))
                        }.simultaneously(with:
                                            DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged { value in
                                                lastLocation = value.location
                                            }))
            
        }
    }
    
    private func rocketBuild(_ rocket: Rocket) -> some View{
        Text("🚀")
            .xxlText(3)
            .floating(changeShadow)
            .glowInTheDark(glowing)
            .position(rocket.point)
            .onAppear {
                withAnimation(Animation.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                    changeShadow.toggle()
                }
                
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
