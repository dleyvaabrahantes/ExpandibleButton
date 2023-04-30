//
//  ContentView.swift
//  ExpandibleButton
//
//  Created by David on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            //Main View
            List(0..<25){ i in
                Text("Main \(i)")
                
            }
            //FavView
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    ExpandableFAB(show: $show)
                        .padding(.trailing, 30)
                }.padding([.bottom], 30)
            }
        }
           
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ExpandableFAB : View {
    @Binding var show : Bool
    
    var body: some View{
        VStack(spacing: 20){
            
            if self.show {
                Button {
                    self.show.toggle()
                } label: {
                    Image(systemName: "tv.fill")
                        .resizable()
                        .frame(width: 35, height: 25)
                        .padding(18)
                }
                .background(Color.blue)
                .foregroundColor(Color.white)
                .clipShape(Circle())
                
                Button {
                    self.show.toggle()
                } label: {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 35, height: 25)
                        .padding(18)
                }
                .background(Color.blue)
                .foregroundColor(Color.white)
                .clipShape(Circle())
            }
            
            Button {
                self.show.toggle()
            } label: {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 25, height: 15)
                    .padding(22)
            }
            .background(Color.blue)
            .foregroundColor(Color.white)
            .clipShape(Circle())
            .rotationEffect(.init(degrees: self.show ? 180 : 0))

        }.animation(.spring())
    }
}
