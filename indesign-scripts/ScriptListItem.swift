//
//  ScriptListItem.swift
//  indesign-scripts
//
//  Created by Yehuda Neufeld on 24/03/2022.
//

import SwiftUI
import CachedAsyncImage

struct ScriptRow: View {
    var script: Script
    
    var body: some View {
        HStack{
            
            CachedAsyncImage(url: URL(string: script.coverImage)) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipped()
            .cornerRadius(3)
            
            Text(script.title)
            
            Spacer()
            
            if (script.isFree) {
                Image(systemName: "gift.circle.fill").foregroundColor(.green).imageScale(.large)
            } else {
                Text("$\(script.price)").font(.footnote)
            }
        }
    }
}
