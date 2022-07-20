//
//  PetalView.swift
//  Drawing
//
//  Created by Jack Farray on 2022-07-16.
//

import SwiftUI


//struct Flower: Shape {
//    var petalOffset = -20.0
//    var petalWidth = 100.0
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        for number in stride(from:0, to: Double.pi * 2, by: Double.pi / 8 ) {
//            let rotation = CGAffineTransform(rotationAngle: number)
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//            
//            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
//            let rotatedPetal = originalPetal.applying(position)
//            
//            path.addPath(rotatedPetal)
//        }
//        
//        return path
//    }
//}
//
//struct PetalView: View {
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
//    
//    var body: some View {
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(.green, lineWidth: 1)
//            
//            Text("Offset")
//            Slider(value: $petalOffset, in: -40...40)
//                .padding([.horizontal, .bottom])
//            
//            Text("Width")
//            Slider(value: $petalWidth, in: 0...100)
//                .padding(.horizontal)
//        }
//    }
//}

//Triangle and circle

//struct Arc: InsettableShape {
//    let startAngle: Angle
//    let end Angle: Angle
//    let clockwise: Bool
//    var insetAmount = 0.0
//
//    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//
//        var path = Path()
//
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//
//        return path
//    }
//
//    func inset(by amount: CGFloat) -> some InsettableShape {
//        var arc = self
//        arc.insetAmount += amount
//        return arc
//    }
//}
//
//
//
//struct ContentView: View {
//    var body: some View {
//
//        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
//            .strokeBorder(.blue, lineWidth: 40)
//
//    }
//}

//                      Flower slider

//struct Flower: Shape {
//    var petalOffset = -20.0
//    var petalWidth = 100.0
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        for number in stride(from:0, to: Double.pi * 2, by: Double.pi / 8 ) {
//            let rotation = CGAffineTransform(rotationAngle: number)
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//
//            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
//            let rotatedPetal = originalPetal.applying(position)
//
//            path.addPath(rotatedPetal)
//        }
//
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
//
//    var body: some View {
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(.green, lineWidth: 1)
//
//            Text("Offset")
//            Slider(value: $petalOffset, in: -40...40)
//                .padding([.horizontal, .bottom])
//
//            Text("Width")
//            Slider(value: $petalWidth, in: 0...100)
//                .padding(.horizontal)
//        }
//    }
//}

//                          Color Circle

//struct ColorCyclingCircle: View {
//    var amount = 0.0
//    var steps = 100
//
//    var body: some View {
//        ZStack {
//            ForEach(0..<steps) { value in
//                Circle()
//                    .inset(by: Double(value))
//                    .strokeBorder(
//                        LinearGradient(
//                            gradient: Gradient(colors: [color(for: value, brightness: 1), color(for: value, brightness: 0.5),]),
//                            startPoint: .top, endPoint: .bottom),
//
//                            lineWidth: 2
//                        )
//            }
//        }
//        .drawingGroup()
//    }
//    func color(for value: Int, brightness: Double) -> Color {
//        var targetHue = Double(value) / Double(steps) + amount
//
//        if targetHue > 1 {
//            targetHue -= 1
//        }
//
//        return Color(hue: targetHue, saturation: 1, brightness: brightness)
//    }
//}
//
//struct ContentView: View {
//    @State private var colorCycle = 0.0
//
//    var body: some View {
//        VStack {
//            ColorCyclingCircle(amount: colorCycle)
//                .frame(width: 300, height: 300)
//
//            Slider(value: $colorCycle)
//        }
//    }
//}
//                               COLOR DIAL / Blur - Color overlay

//struct ContentView: View {
//    @State private var amount = 0.0
//
//    var body: some View {
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(Color(red: 1, green: 0, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//                    
//                Circle()
//                    .fill(Color(red: 0, green: 1, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//                    
//                Circle()
//                    .fill(Color(red: 0, green: 0, blue: 1))
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
//                    
//            Slider(value: $amount)
//                .padding()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.black)
//            .ignoresSafeArea()
//        }
//    }
//

//                      Animatable Data / Trapazoid

//
//struct Trapezoid: Shape {
//    var insetAmount: Double
//
//    var animatableData: Double {
//        get { insetAmount }
//        set { insetAmount = newValue }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: 0, y: rect.maxY))
//        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
//
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var insetAmount = 50.0
//
//    var body: some View {
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 200)
//            .onTapGesture {
//                withAnimation {
//                    insetAmount = Double.random(in: 10...90)
//            }
//        }
//    }
//}
//

    //                  Checkerboard  / AnimatablePair
//struct Checkerboard: Shape {
//    var rows: Int
//    var columns: Int
//    
//    var animatableData: AnimatablePair<Double, Double> {
//        get {
//            AnimatablePair(Double(rows), Double(columns))
//        }
//        
//        set {
//            rows = Int(newValue.first)
//            columns = Int(newValue.second)
//        }
//    }
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        let rowSize = rect.height / Double(rows)
//        let columnSize = rect.width / Double(columns)
//        
//        for row in 0..<rows {
//            for column in 0..<columns {
//            if (row + column).isMultiple(of: 2) {
//                let startX = columnSize * Double(column)
//                let startY = rowSize * Double(row)
//                
//                let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
//                path.addRect(rect)
//                
//                }
//            }
//        }
//         
//        return path
//        
//    }
//}
//
//struct ContentView: View {
//    @State private var rows = 4
//    @State private var columns = 4
//    
//    var body: some View {
//        Checkerboard(rows: rows, columns: columns)
//            .onTapGesture {
//                withAnimation(.linear(duration: 3)) {
//                    rows = 8
//                    columns = 16
//                }
//            }
//    }
//}
//

                        // lineWidth Fix

//struct ArrowView: View {
//    @State private var isLineTapped = false
// 
//    var body: some View {
//        VStack {
//        Arrowzoid()
//            .stroke(lineWidth: isLineTapped ? 10 : 0)
//            .fill(isLineTapped ? .yellow : .red)
//            Button {
//               withAnimation {
//                   isLineTapped.toggle()
//               }
//             } label: {
//                 Text(“click me”)
//             }
//        }
//    }
//}
