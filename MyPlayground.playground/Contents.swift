//: Playground - noun: a place where people can play

import UIKit

let config = URLSessionConfiguration.default // Session Configuration
let session = URLSession(configuration: config) // Load configuration into Session
let url = URL(string: "https://enermong.scalingo.io/api/1/getUsage")!

let task = session.dataTask(with: url, completionHandler: {
    (data, response, error) in
    if error != nil {
        print(error!.localizedDescription)
    } else {
        do {
            if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]{
                //Implement your logic
                if let names = json["result"] as? [String] {
                    print(names)
                }
                print(json)
                
            }
            
        } catch {
            
            print("error in JSONSerialization")
            
        }
        
        
    }
})
task.resume()