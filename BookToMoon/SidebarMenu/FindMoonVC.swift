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
    

    @IBOutlet weak var lngLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    
    var locationManager: CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
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
    
    func moonLocationLatitudeLongitude() {
        
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
