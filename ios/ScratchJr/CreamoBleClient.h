//
//  CreamoBleClient.h
//  ScratchJr
//
//  Created by Yazz on 2020/03/06.
//  Copyright © 2020 Playful Invention Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "Popup.h"


@interface CreamoBleClient : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate, CBCentralManagerDelegate>
{
    
    
}

+(CreamoBleClient *)bleSingletone;
+(void)centralManagerDidUpdateState:(CBCentralManager *)central;

+(void)beginScanningForDevice;
+(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)aPeripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI;
+(void)centralManager:(CBCentralManager *)central
didConnectPeripheral:(CBPeripheral *)peripheral;



+(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error;

+(void)writeValue:(NSData *)data
forCharacteristic:(CBCharacteristic *)characteristic
             type:(CBCharacteristicWriteType)type;

+(void)sendValue:(NSString *)str;
+(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error;

+(void)stopForDevice;

- (void)centralManagerDidUpdateState:(CBCentralManager *)central;
@property(nonatomic, retain) CBCentralManager *CbCentralManager;
@property(strong, nonatomic) CBPeripheral *discoveredPeripheral;
@property(nonatomic, retain) NSDictionary *data;
@property(nonatomic, retain) NSString *deviceName;
@property(nonatomic, retain) CBCharacteristic *Charater;
@property(nonatomic, retain) NSError *error;
@property(nonatomic, retain) NSString *stringError;
@property (strong, nonatomic) NSMutableDictionary *devices;







@end
