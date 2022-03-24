//
//  ScriptShow.swift
//  indesign-scripts
//
//  Created by Yehuda Neufeld on 24/03/2022.
//

import SwiftUI
import MapKit
import CachedAsyncImage

struct ScriptDetail: View {
    
    var script: Script
    
    @State private var isShowingPopover = false
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.7711525, longitude: 35.2206184),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    
    var body: some View {
        ScrollView {
            VStack {
                CachedAsyncImage(url: URL(string: script.coverImage)) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                
                Text(script.title).font(.headline).foregroundColor(.accentColor)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("v\(script.version)" ).font(.footnote).foregroundColor(.gray)
                
                Text(script.excerpt).font(.footnote).foregroundColor(.primary)
                    .padding()
                
                HStack {
                    Text("Compatibility: \(script.compatibility)")
                    Spacer()
                    Text("Price: $\(script.price)")
                }.padding(.horizontal)
                
                Spacer()
                    .padding(.top, 80)
                
                Link("Buy Now", destination: URL(string: "https://indesign.yiddishe-kop.com/scripts/\(script.id)")!)
                    .padding(.vertical, 30)
                
                Button("Show Popover", action: {
                    self.isShowingPopover = true
                })
                .popover(isPresented: $isShowingPopover, arrowEdge: .trailing) {
                    Map(coordinateRegion: $region)
                        .frame(width: 300, height: 300)
                }
            }
        }
        .navigationTitle(script.title)
    }
}

struct ScriptDetail_Previews: PreviewProvider {
    static var previews: some View {
        ScriptDetail(script: Script(id: 1, title: "Rav Text", description: "A revolutionary script that gives you the tools to create complex page layouts in Adobe InDesign", price: "490", finalPrice: "490", onSale: false, isFree: false, fileSize: 2000, compatibility: "CC2020+", coverImage: "https://indesign.yiddishe-kop.com/storage/images/jV3Y1T5r4K47jARy8Urt1nkA9eQmBUZTHPt3yVxS.jpeg", updated_at: "111", excerpt: "Amazing!", version: "2.2.0"))
    }
}
