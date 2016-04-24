//
//  FindMoonVC.swift
//  BookToMoon
//
//  Created by Kaira Villanueva on 4/24/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import CoreLocation

class FindMoonVC: UIViewController, CLLocationManagerDelegate {
    

    @IBOutlet weak var azimuthAmountLabel: UILabel!
    
    var locationManager: CLLocationManager!
    
    
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
        print (latCoord, lngCoord)
        
    }
    
    /*    north representing 0° or 360°
     *    east representing 90°
     *    south representing 180°
     *    west representing 270°
     */
    func locationManager(manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        
        //azimuthAmountLabel = String(heading.magneticHeading)

        if (heading.magneticHeading > 264 && heading.magneticHeading < 265) {
            print("omg shoes")
        }
        
        // This will print out the direction the device is heading
        print(heading.magneticHeading)
    
    }
    
    // INVOKE Wolfram Alpha API
    func wolframAlphaCall() {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
