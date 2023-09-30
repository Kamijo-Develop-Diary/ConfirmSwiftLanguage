//
//  ContentView.swift
//  ConfirmSwiftLaungage
//
//  Created by 上條栞汰 on 2023/09/19.
//

import SwiftUI
import CasePaths

struct CasePathDebug: View {
    
    enum ParentAction {
        case action1(id: String)
        case action2(id: Int)
        case action3(ChildAction)
    }
    
    enum ChildAction {
        case action1
        case action2(childId: String)
    }
    
    var body: some View {
        Text("")
            .onAppear {
                print(/ParentAction.action1)
                print(/ParentAction.action2)
                print(/ParentAction.action3)
                
                
                
                let embed1 = (/ParentAction.action1).embed("0")
                let embed2 = (/ParentAction.action2).embed(1)
                let embed3 = ((/ParentAction.action3)).embed(.action1)
                (/ParentAction.action1).extract(from: embed1)
                (/ParentAction.action2).extract(from: embed2)
                (/ParentAction.action3).extract(from: embed3)
                // Optional("0")
                // Optional(1)
                // Optional(ChildAction.action1)

            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CasePathDebug()
    }
}
