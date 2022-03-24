//
//  ContentView.swift
//  indesign-scripts
//
//  Created by Yehuda Neufeld on 24/03/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var message: String
    
    @State private var isShowingPopover = false
    @State private var playNotificationSounds = false
    @State private var sendReadReceipts = false
    @State private var profileImageSize = 1
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.7711525, longitude: 35.2206184),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    
    var body: some View {
        HStack {
            Form {
                Toggle("Play notification sounds", isOn: $playNotificationSounds)
                Toggle("Send read receipts", isOn: $sendReadReceipts)

                Picker("Profile Image Size:", selection: $profileImageSize) {
                    Text("Large").tag(3)
                    Text("Medium").tag(2)
                    Text("Small").tag(1)
                }
                .pickerStyle(.inline)

                Button("Clear Image Cache") {}
    
                Button("Show Popover", action: {
                    self.isShowingPopover = true
                })
                .popover(isPresented: $isShowingPopover, arrowEdge: .bottom) {
                    Map(coordinateRegion: $region)
                        .frame(width: 300, height: 300)
                }
            }
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(message: "Hello world!")
        }
    }
}
