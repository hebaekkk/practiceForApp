//
//  ContentView.swift
//  feelingCloneCoding_practice
//
//  Created by BigHand on 2020/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Rating()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Rating : View {
    //slider Value...
    @State var value : CGFloat = 0.5
    
    var body: some View {
        
        VStack {
            
            Text("How was your Day?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            Smile(value: value)
                .stroke(Color.black, lineWidth: 3)
                .frame(height: 150)
            
            Slider(value: $value)
                .padding()
            Spacer(minLength: 0)
        }
        .background(
            (value <= 0.3 ? Color("Color1") : (value > 0.3 && value <= 0.7 ? Color("Color2") : Color("Color3")))
                .ignoresSafeArea(.all, edges: .all)
                .animation(.easeInOut)
        )
    }
}
//Smile Shape...
struct Smile: Shape {
    var value: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            
            let center = rect.width / 2
            
            let downRadius: CGFloat = 25
            
            let to1 = CGPoint(x: center, y: downRadius)
            let control1 = CGPoint(x: center - 145, y: 0)
            let control2 = CGPoint(x: center - 145, y: downRadius)
            
            let to2 = CGPoint(x: center + 150, y: 0)
            let control3 = CGPoint(x: center + 145, y: downRadius)
            let control4 = CGPoint(x: center + 145, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4 )


            
        }
    }
}
