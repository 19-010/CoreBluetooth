//
//  ViewController.swift
//  BLE Switch
//
//  Created by colin martin on 11/9/19.
//  Copyright © 2019 colin martin. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate{
    
    let hueService = ""
    var centralManager: CBCentralManager!
    var connectedPeriperhal: CBPeripheral!
    
    
    
    
    @IBOutlet weak var uiSwitch: UISwitch!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBAction func uiSwitchVAlueChanged(_ sender: UISwitch) {
        if (sender.isOn){
            print("Switch is ON")
        }else{
            print("Swtich is OFF")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centralManager = CBCentralManager(delegate: self, queue:   nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: Selector(("hasConnected")), userInfo: nil, repeats: false)
        
        activityIndicator.startAnimating()
        
        //MARK: - Make BLE connection
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //MARK: - Make Ble Connection
    }
    @objc func hasConnected(){
        activityIndicator.stopAnimating()
        shadowView.isHidden = true
    }
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch(central.state){
            
        case .unknown:
            print("Unknown")
        case .resetting:
                        print("Unknown")

        case .unsupported:
                        print("Unsupprted")

        case .unauthorized:
                        print("Unauthorized")

        case .poweredOff:
                        print("Powered Off")

        case .poweredOn:
                        print("Powered on")

        @unknown default:
            print("No bluetooth Services available")
        }
    }
    

}

