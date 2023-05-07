//
//  CardView.swift
//  Flashzilla
//
//  Created by Tamim Khan on 7/5/23.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    @State private var isShowingAns = false
    
    @State private var offset = CGSize.zero
    
    var removel: (() -> Void)? = nil
    
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor ?.white : .white.opacity(1 - Double(abs(offset.width / 50)))
                )
                .background{
                    differentiateWithoutColor ? nil : RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? .red : .green)
                }
                
                .shadow(radius: 10)
            
            VStack{
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                if isShowingAns{
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                    
                }
                
            }
            
            .padding(20)
            .multilineTextAlignment(.center)
            
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    offset = gesture.translation
                    
                }
                .onEnded{ _ in
                    if abs(offset.width) > 100{
                        removel?()
                    }else{
                        offset = .zero
                    }
                    
                }
        )
        
        
        
        .onTapGesture {
            isShowingAns.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .example)
    }
}
