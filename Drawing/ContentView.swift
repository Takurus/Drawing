//
//  ContentView.swift
//  Drawing
//
//  Created by Jack Farray on 2022-07-16.
//

import SwiftUI

struct ContentView: View {
    @State private var colorCycle = 0.0
    @State private var locX = 50.0
    @State private var locY = 50.0
    @State private var useGradient = true

    let baseCornerRadius = 25.0

    var body: some View {
        VStack {
            Toggle("Use gradient?", isOn: $useGradient)
            ZStack {
                GeometryReader { geo in
                    let w = geo.size.width
                    let h = geo.size.height
                    let m = min(w,h)
                    let centerX = locX * w / 100
                    let centerY = locY * h / 100
                    VStack {
                        if useGradient {
                            let center = UnitPoint(x: centerX / w, y: centerY / h)
                            RoundedRectangle(cornerRadius: baseCornerRadius)
                                .fill(
                                    RadialGradient(gradient: Gradient(colors: colors(steps: Int(m), amount: colorCycle)), center: center, startRadius: 0, endRadius: m/2))
                        } else {
                            ZStack {
                                ForEach(0..<Int(m), id: \.self) { value in
                                    let v = CGFloat(value)
                                    let cornerRadius = baseCornerRadius * (m - Double(value)) / m
                                    RoundedRectangle(cornerRadius: cornerRadius)
                                        .size(width: w-(v*w/m), height: h-(v*h/m))
                                        .offset(x: v*(centerX/m), y: v*(centerY/m))
                                        .stroke(color(for: value, amount: colorCycle, steps: Int(m)), lineWidth: 2)

                                }
                            }
                        }
                    }
                }
            }

            Text("Color cycle")
            Slider(value: $colorCycle)

            Text("centerX")
            Slider(value: $locX, in: 5...95, step: 1)

            Text("centerY")
            Slider(value: $locY, in: 5...95, step: 1)
        }
    }

    func color(for value: Int, amount: Double, steps: Int) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        targetHue = targetHue.truncatingRemainder(dividingBy: 1)

        return Color(hue: targetHue, saturation: 1, brightness: 1)
    }

    func colors(steps: Int, amount: Double) -> [Color] {
        var colors = [Color]()

        for i in 0..<steps {
            colors.append(color(for: i, amount: amount, steps: steps))
        }

        return colors
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
