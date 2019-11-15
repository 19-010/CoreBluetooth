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
    
    var peripherals:[CBPeripheral] = []

    var centralManager: CBCentralManager!
    var connectedPeriperhal: CBPeripheral!
    var writeCharacteristic: CBCharacteristic!

    
    
    @IBOutlet weak var uiSwitch: UISwitch!

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func uiSwitchVAlueChanged(_ sender: UISwitch) {
        if (sender.isOn){
            print("Switch is ON")
            
            writeData(string:"<ON>")
        }else{
            print("Switch is OFF")
            writeData(string: "<OFF>")

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centralManager = CBCentralManager(delegate: self, queue:   nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

        
        //MARK: - Make BLE connection
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        //MARK: - Make Ble Connection
    }
    func scanForDevices(){
        centralManager.scanForPeripherals(withServices: nil, options: nil)
//        centralManager?.scanForPeripherals(withServices:[BLEService_UUID], options: [CBCentralManagerScanOptionAllowDuplicatesKey:false])
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.stopScanning()
        }

    }
    func stopScanning(){
        centralManager.stopScan()
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Found Peripheral Name: \(String(describing: peripheral.name))")

//        if (peripheral.name != nil){
//            print("Found Peripheral Name: \(String(describing: peripheral.name))")
//
//        }else {
//            print("No device  found")
//        }
        
        //Save connected Peripheral
        connectedPeriperhal = peripheral;
//        stopScanning()
        
        centralManager.connect(connectedPeriperhal, options: nil)
        
        
        
    }
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to \(String(describing: peripheral.name))")
        
        connectedPeriperhal.delegate = self
        
        connectedPeriperhal.discoverServices([BLEService_UUID])
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
        print("Service= \(String(describing: peripheral.services!.count))")

        for service in peripheral.services!{
            print("Services = \(service)")

            let aService = service as CBService
            if service.uuid == BLEService_UUID{
                peripheral.discoverCharacteristics(nil, for: aService)
            }

        }
        
      

    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
      
        for characteristic in service.characteristics!{

            let aCharacteristic = characteristic as CBCharacteristic

            if aCharacteristic.uuid == BLECharacteristic_UUID{
                writeCharacteristic = aCharacteristic
            }
        }
    }
    
    func writeData(string :String){
        
        let data = string.data(using: String.Encoding.utf8)
        connectedPeriperhal?.writeValue(data!, for: writeCharacteristic, type: CBCharacteristicWriteType.withResponse)
        
    
            


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
            scanForDevices()

        @unknown default:
            print("No bluetooth Services available")
        }
    }
    

}

