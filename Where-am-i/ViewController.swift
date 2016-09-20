//
//  ViewController.swift
//  Where-am-i
//
//  Created by 임성훈 on 2016. 9. 7..
//  Copyright © 2016년 임성훈. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AVFoundation // tts 라이브러리

class ViewController: UIViewController{

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var currentLocText: UILabel!
    var locationManager: LocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = LocationManager(mapView: mapView, currentLocText: currentLocText)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func currentLocSpeck(_ sender: UIButton) { // 현재위치말하기 처리
        TTSModule.speak(text: currentLocText.text!)
        print(currentLocText.text!)
    }
}

