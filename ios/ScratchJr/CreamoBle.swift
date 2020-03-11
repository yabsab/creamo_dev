//
//  CreamoBle.swift
//  ScratchJr
//
//  Created by Yazz on 2020/03/04.
//  Copyright © 2020 Playful Invention Company. All rights reserved.
//

import Foundation
import CoreBluetooth



@objc class CreamoBle : NSObject, CBCentralManagerDelegate
    {


    
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral?
    var dataCharacteristic: CBCharacteristic?

    override init() {
    super.init()
    centralManager = CBCentralManager(delegate: self, queue: nil)
      }
    
    @objc func test()
    {
        
        print("te")
        
    }
    
    
 
    
    @objc func ble()
    {
        print("-----------------scan started-----------------")
       centralManager = CBCentralManager(delegate: self, queue: .main)
         
        
    }

    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
         
    }
}
