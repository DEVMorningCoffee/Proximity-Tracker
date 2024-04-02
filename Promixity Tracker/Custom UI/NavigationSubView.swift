//
//  NavigationSubView.swift
//  Promixity Tracker
//
//  Created by user238598 on 4/2/24.
//

import SwiftUI

struct NavigationSubView<Content: View>: View {
    let content: Content
    let spacing: CGFloat
    
    init(spacing: CGFloat = 0, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.spacing = spacing
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: spacing) {
                
                content
                
            }.padding(.bottom, 30)
                .frame(maxWidth: Constants.maxWidth)
                .frame(maxWidth: .infinity)
        }
        .modifier(CustomFormBackground())
    }
}
