//
//  ArrowView.swift
//  Drawing
//
//  Created by Jack Farray on 2022-07-20.
//

import SwiftUI


struct Arrowzoid: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 60, y: 200))
        path.addLine(to: CGPoint(x: 160, y: 50))


        path.move(to: CGPoint(x: 260, y: 200))
        path.addLine(to: CGPoint(x: 157, y: 50))

        path.move(to: CGPoint(x: 160, y: 500))
        path.addLine(to: CGPoint(x: 158, y: 50))

        return path


    }
}


struct ArrowView: View {
    @State private var isLineTapped = false

    var body: some View {
        VStack {
        Arrowzoid()
            .stroke(lineWidth: isLineTapped ? 10 : 8)
            .fill(isLineTapped ? .yellow : .green)
        Button {
            withAnimation {
                isLineTapped.toggle()
                }
            } label: {
                Text("Click me")
            }
        }
    }
}


struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
