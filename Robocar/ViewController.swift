//
//  ViewController.swift
//  Robocar
//
//  Created by Hendrik Louw on 2016/03/19.
//  Copyright © 2016 Hendrik Louw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let baseUrl = "http://192.168.43.13:3000"
    var forwardSpeed = 125
    let turnSpeed = 200
    
    @IBAction func speedSlider(sender: UISlider) {
        forwardSpeed = Int(sender.value)
        
    }
    
    func callSpeedURL(url: String, params: Dictionary<String, AnyObject>) {
        let url = NSURL(string: baseUrl + url)!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            try request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: [])
        } catch {
            
        }
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            print(response.debugDescription)
        }
        task.resume()
    }
    
    @IBAction func forwardButtonClicked(sender: UIButton) {
        let params = ["speed": forwardSpeed] as Dictionary<String, Int>
        callSpeedURL("/api/robots/robocar/commands/forward", params: params)
    }
   
    @IBAction func forwardButtonExit(sender: UIButton) {
        stopAcceleration()
    }
    
    @IBAction func backwardButtonClicked(sender: UIButton) {
        let params = ["speed": forwardSpeed] as Dictionary<String, Int>
        callSpeedURL("/api/robots/robocar/commands/backward", params: params)
    }
    
    @IBAction func backwardButtonExit(sender: AnyObject) {
        stopAcceleration()
    }
    
    @IBAction func leftButtonClicked(sender: UIButton) {
        let params = ["speed": turnSpeed] as Dictionary<String, Int>
        callSpeedURL("/api/robots/robocar/commands/left", params: params)
    }
    
    @IBAction func leftButtonExit(sender: AnyObject) {
        stopTurning()
    }
    
    @IBAction func rightButtonClicked(sender: UIButton) {
        let params = ["speed": turnSpeed] as Dictionary<String, Int>
        callSpeedURL("/api/robots/robocar/commands/right", params: params)    }
    
    
    @IBAction func rightButtonExit(sender: AnyObject) {
        stopTurning()
    }
    

    @IBAction func stopButtonClicked(sender: UIButton) {
      stop()
    }
    
    
    
    func stop() {
        let params = [:] as Dictionary<String, String>
        callSpeedURL("/api/robots/robocar/commands/stop", params: params)
    }
    
    
    func stopAcceleration() {
        let params = [:] as Dictionary<String, String>
        callSpeedURL("/api/robots/robocar/commands/stop_acceleration", params: params)
    }


    func stopTurning() {
        let params = [:] as Dictionary<String, String>
        callSpeedURL("/api/robots/robocar/commands/stop_turning", params: params)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

