//
//  ScriptsIndex.swift
//  indesign-scripts
//
//  Created by Yehuda Neufeld on 24/03/2022.
//

import SwiftUI

struct ScriptIndex: View {
    
    @StateObject var store = ScriptStore()
    
    var body: some View {
        
        NavigationView {
            
            List(store.scripts) { script in
                
                NavigationLink {
                    
                    ScriptDetail(script: script)
                    
                } label: {
                    ScriptRow(script: script)
                }
                
            }
            .frame(minWidth: 200, idealWidth: 250)
            
        }
        
    }
    
}

struct ScriptIndex_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScriptIndex()
        }
    }
}
