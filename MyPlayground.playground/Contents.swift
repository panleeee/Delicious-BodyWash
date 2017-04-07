//: Playground - noun: a place where people can play

import UIKit
var a : String
var shouldKeepRunning = true
//var resultHTML : String
var json = [[String:Any]]()
URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "https://enermong.scalingo.io/api/1/getUsage")!) {
    (data, response, error) in
  var resultHTML = String(data: data!, encoding: String.Encoding.utf8)!
    print(resultHTML)
    a = resultHTML
    shouldKeepRunning = false
    }.resume()
while shouldKeepRunning && RunLoop.current.run(mode: .defaultRunLoopMode, before: .distantFuture) {
}


<<<<<<<
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
=======
do {
    let json =
            try JSONSerialization.jsonObject(with: a, options: [JSONSerialization.ReadingOptions.mutableContainers]) as! [String: AnyObject]
    if let names = json["data"]["usage"] as? [Any] {
        print(names)
    }
} catch let error as NSError {
    print("Failed to load: \(error.localizedDescription)")
}


>>>>>>>