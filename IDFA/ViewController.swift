//
//  ViewController.swift
//  IDFA
//
//  Created by Abhishek Pandey on 28/04/22.
//

import UIKit

import AppTrackingTransparency
import AdSupport

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        print ("PS: It'll be null for Simulator")
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status{
            case .notDetermined:
                print("Not Determined")
            case .restricted:
                print("Restricted")
            case .denied:
                print("Denied")
            case .authorized:
                print("IDFA value is: ", ASIdentifierManager.shared().advertisingIdentifier.uuidString)
            @unknown default:
                print("error")
            }
            
//        if #available(iOS 14, *) {
//            guard ATTrackingManager.trackingAuthorizationStatus == .authorized else {
//                        return
//            }
//        } else {
//            guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else {
//                        return
//            }
//        }
//        // Print IDFA
//        print(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
        }
    }

}

