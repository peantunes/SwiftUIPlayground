//
//  PolygonShape.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 18/04/2021.
//

import SwiftUI

struct PolygonShape: Shape {
    private var sidesAsDouble: Double
    private var scale: Double
    
    init(sides: Int, scale: Double) {
        sidesAsDouble = Double(sides)
        self.scale = scale
    }
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(sidesAsDouble, scale) }
        set {
            sidesAsDouble = newValue.first
            scale = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let h = rect.hypotenuse * scale
        let c = rect.center
        
        var path = Path()
        
        let extra: Int = Double(sidesAsDouble) != Double(Int(sidesAsDouble)) ? 1 : 0
        
        var vertex: [CGPoint] = []
        
        for i in 0..<Int(sidesAsDouble) + extra {
            let angle = (Double(i) * (360.0 / sidesAsDouble)) * Double.pi / 180
            
            // Calculate vertex position
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            vertex.append(pt)
            
            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        
        
        path.closeSubpath()
        
        // Draw vertex-to-vertex lines
        drawVertexLines(path: &path, vertex: vertex, n: 0)
        
        return path
    }
    
    func drawVertexLines(path: inout Path, vertex: [CGPoint], n: Int) {
        
        if (vertex.count - n) < 3 { return }
        
        for i in (n+2)..<min(n + (vertex.count-1), vertex.count) {
            path.move(to: vertex[n])
            path.addLine(to: vertex[i])
        }
        
        drawVertexLines(path: &path, vertex: vertex, n: n+1)
    }
}

struct SampleView: View {
    @State var sides: Int = 4
    @State var scale: Double = 1.0
    var body: some View {
        VStack {
            
            PolygonShape(sides: sides, scale: scale)
                .stroke(Color.red, lineWidth: 3)
                .animation(Animation.easeInOut(duration: 1.4))
                .padding()
            HStack {
                Text("1")
                    .padding()
                    .aqua()
                    .onTapGesture {
                        sides = 1
                        scale = 0.1
                    }
                Text("3")
                    .padding()
                    .aqua()
                    .onTapGesture {
                        sides = 3
                        scale = 0.4
                    }
                Text("4")
                    .padding()
                    .aqua()
                    .onTapGesture {
                        sides = 4
                        scale = 1.0
                    }
                Text("8")
                    .padding()
                    .aqua()
                    .onTapGesture {
                        sides = 8
                        scale = 1.0
                    }
                Text("12")
                    .padding()
                    .aqua()
                    .onTapGesture {
                        sides = 12
                        scale = 0.8
                    }
                Text("20")
                    .padding()
                    .aqua()
                    .onTapGesture {
                        sides = 20
                        scale = 0.6
                    }
            }
        }
    }
}

struct PolygonShape_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}

extension CGRect {
    var center: CGPoint {
        CGPoint(x: size.width / 2.0, y: size.height / 2.0)
    }
    
    var hypotenuse: Double {
        Double(min(size.width, size.height)) / 2.0
    }
}
