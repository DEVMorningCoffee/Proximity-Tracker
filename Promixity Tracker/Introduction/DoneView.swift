//
//  DoneView.swift
//  Promixity Tracker
//
//  Created by user238598 on 4/2/24.
//

import SwiftUI


struct IntroductionDoneView: View {
    
    let settings = Settings.sharedInstance
    
    var body: some View {
        
        BigButtonView(buttonHeight: Constants.BigButtonHeight, mainView: BigSymbolViewWithText(title: "all_done", symbol: "checkmark.circle.fill", subtitle: "all_done_description"), buttonView: ColoredButton(action: {
            settings.tutorialCompleted = true
        }, label: "continue"))
    }
}


struct Previews_IntroductionDoneView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionDoneView()
    }
}
