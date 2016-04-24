//
//  FindMoonVC.swift
//  BookToMoon
//
//  Created by Kaira Villanueva on 4/24/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import CoreLocation
import AudioToolbox

class FindMoonVC: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var azimuthLabel: UILabel!
    var locationManager: CLLocationManager!
    
    var nextBoard: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // RETRIEVE THE USER'S LATITUDE AND LONGITUDE
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location: CLLocation = locations.last!
        let latCoord = location.coordinate.latitude
        let lngCoord = location.coordinate.longitude
    }
    
    /*    north representing 0° or 360°
     *    east representing 90°
     *    south representing 180°
     *    west representing 270°
     */
    func locationManager(manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        
        
        var azimuth: Double = heading.magneticHeading
        var azimuthString = String(format:"%.2f", azimuth)
        
        azimuthLabel.text = azimuthString



        if (heading.magneticHeading > 264 && heading.magneticHeading < 265) {
            
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MainBase")as!SWRevealViewController
            
            self.presentViewController(controller, animated: true, completion: nil)
        }
        
        // This will print out the direction the device is heading
        print(heading.magneticHeading)
    
    }
    
    // INVOKE Wolfram Alpha API
    func wolframAlphaCall() {
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
 

}
