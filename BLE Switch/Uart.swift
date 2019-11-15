//
//  Uart.swift
//  BLE Switch
//
//  Created by colin martin on 11/9/19.
//  Copyright © 2019 colin martin. All rights reserved.
//

import CoreBluetooth




let kBLEService_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9e"
let WRITE_CHARACTERISTIC = "6e400002-b5a3-f393-e0a9-e50e24dcca9e"
let READ_CHARACTERISTIC = "6e400003-b5a3-f393-e0a9-e50e24dcca9e"
let MaxCharacters = 20

let BLEService_UUID = CBUUID(string: kBLEService_UUID)
let BLECharacteristic_UUID = CBUUID(string: WRITE_CHARACTERISTIC)//(Property = Write without response)
let BLE_Characteristic_uuid_Rx = CBUUID(string: READ_CHARACTERISTIC)// (Property = Read/Notify)




////let kBLEService_UUID = "97FE6561-0004-4F62-86E9-B71EE2DA3D22"
//let kBLEService_UUID = "0xFE0F"
//
//let  WRITE_CHARACTERISTIC = "932C32BD-0000-47A2-835A-A8D455B859DD"
//
//
//let MaxCharacters = 20
//
//let BLEService_UUID = CBUUID(string: kBLEService_UUID)
//let BLECharacteristic_UUID = CBUUID(string: WRITE_CHARACTERISTIC)


