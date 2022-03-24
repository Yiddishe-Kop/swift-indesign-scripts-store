//
//  Store.swift
//  indesign-scripts
//
//  Created by Yehuda Neufeld on 24/03/2022.
//

import Foundation
import SwiftUI

class ScriptStore: ObservableObject {
    @Published var scripts = [Script]()
    
    init() {
        self.fetchScripts()
    }
    
    func fetchScripts()  {
        print("fetching scripts...")
        let task = URLSession.shared.dataTask(with: URL(string: "https://indesign.yiddishe-kop.com/api/scripts")!, completionHandler: { (data, response, error) in
            
            if let error = error {
                print("error \(error)")
                return
            }
            
            if let decodedScripts = try? JSONDecoder().decode([Script].self, from: data!) {
                self.scripts = decodedScripts
                print("\(self.scripts.count) scripts loaded")
            }
            
        })
        task.resume()
    }
}
