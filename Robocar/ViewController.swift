//
//  ViewController.swift
//  Robocar
//
//  Created by Hendrik Louw on 2016/03/19.
//  Copyright © 2016 Hendrik Louw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func forwardButtonClicked(sender: UIButton) {
        let url = NSURL(string: "http://172.20.10.2:3000/api/robots/dc_motor_bot/commands/forward")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
        }
        task.resume()
    }
   
    @IBAction func forwardButtonExit(sender: UIButton) {
        stopAcceleration()
    }
    
    @IBAction func backwardButtonClicked(sender: UIButton) {
        let url = NSURL(string: "http://172.20.10.2:3000/api/robots/dc_motor_bot/commands/backward")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
    @IBAction func backwardButtonExit(sender: AnyObject) {
        stopAcceleration()
    }
    
    @IBAction func leftButtonClicked(sender: UIButton) {
        let url = NSURL(string: "http://172.20.10.2:3000/api/robots/dc_motor_bot/commands/left")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
    @IBAction func leftButtonExit(sender: AnyObject) {
        stopTurning()
    }
    
    @IBAction func rightButtonClicked(sender: UIButton) {
        let url = NSURL(string: "http://172.20.10.2:3000/api/robots/dc_motor_bot/commands/right")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
    
    @IBAction func rightButtonExit(sender: AnyObject) {
        stopTurning()
    }
    

    @IBAction func stopButtonClicked(sender: UIButton) {
      stop()
    }
    
    
    
    func stop() {
        let url = NSURL(string: "http://172.20.10.2:3000/api/robots/dc_motor_bot/commands/stop_acceleration")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
        }
        task.resume()
        
    }
    
    
    func stopAcceleration() {
        let url = NSURL(string: "http://172.20.10.2:3000/api/robots/dc_motor_bot/commands/stop_acceleration")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
        }
        task.resume()
        
    }


    func stopTurning() {
        let url = NSURL(string: "http://172.20.10.2:3000/api/robots/dc_motor_bot/commands/stop_turning")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
        }
        task.resume()

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

