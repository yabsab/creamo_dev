//
//  CreamoBleClient.m
//  ScratchJr
//
//  Created by Yazz on 2020/03/06.
//  Copyright © 2020 Playful Invention Company. All rights reserved.
//

#import "CreamoBleClient.h"
#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <UIKit/UIKit.h>
#import "ViewController.h"




CBCentralManager *CbCentralManager;

CBPeripheral *discoveredPeripheral;
CBCharacteristic *Charater;
NSData *sendData;
CBService *service;
NSArray *devices;
NSString *bleName;
NSMutableArray *getDivce;
int n = 0;


@implementation CreamoBleClient



//@synthesize CbCentralManager;
/*
  SingleTone,
  블루투스 스캔
  개발 : 안재용
  e-mail : sk8yabsab@gmail.com
  날짜 : 2020년03월06일
  */
 
//sharedinstance 
+ (instancetype)create
{
    static CreamoBleClient    *    instance;
    static dispatch_once_t                onceToken;
   
//한번만 생성
    dispatch_once(&onceToken, ^{
        instance = [self new];
        getDivce = [[NSMutableArray alloc]init];
    });
    return instance;
}


- (id)init {
  if (self = [super init])
  
  {
    
  }
  return self;
}

- (void)dealloc
{
  // Should never be called, but just here for clarity really.
}

//블루투스 on
+(void)centralManagerDidUpdateState:(CBCentralManager *)central

{ //휴대폰의 블루투스가 켜져있을 경우.
    if(central.state == CBManagerStatePoweredOn)
    {
      //UUID
        [CbCentralManager scanForPeripheralsWithServices:nil options:nil];
        }
    else
        {
            NSLog(@"블루투스 스캔 OFF 상태");
        }
    }

//블루투스 connect 탐색 및
+(void)centralManager:(CBCentralManager *)central
didConnectPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"=======================================");
    NSLog(@"연결된 기기");
    deviceName = peripheral.name;
    NSLog(@"%@",deviceName);
    
    peripheral.delegate = self;
   [peripheral discoverServices:nil];
    
}


+(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    // Enumerate through all services on the connected peripheral.
    for (CBService* service in peripheral.services)
    {
        // Discover all characteristics for this service.
        [peripheral discoverCharacteristics:nil forService:service];

        NSLog(@"service start");

    }    
}


//+(void)sendValue:(NSData *)str
//{
//
////   CBService *service;
//
//
//for (service in [discoveredPeripheral services])
//    {
//
//
//
//        NSLog(@"service");
//
//
//       for (CBCharacteristic * characteristic in [service characteristics])
//       {
//
//           [discoveredPeripheral writeValue:str
//           forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];
//
//
//
//      }
//   }
//}


+(void)sendValue:(NSString *)str
{
    
//   CBService *service;

    
for (service in [discoveredPeripheral services])
    {
        
        NSLog(@"service");
        
       for (CBCharacteristic * characteristic in [service characteristics])
       {
           
           [discoveredPeripheral writeValue:[str dataUsingEncoding:
           NSUTF8StringEncoding]
           forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];
       
      }
   }
}
//블루투스 탐색 및 정보 가져오기
+(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)Peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    
   
    
    
//  NSLog(@"Discovered %@ %@", Peripheral, advertisementData);
    discoveredPeripheral = Peripheral ;
    
    deviceName =Peripheral.name;
    NSLog(@"devicename %@", deviceName);
    [self get_device:deviceName];
    //임시 함수
    
   if([deviceName isEqualToString:@"Creamo"])
   

        {
           
        [CbCentralManager connectPeripheral:discoveredPeripheral options:nil];
        
       //블루투스 status call 기능
        ViewController *VC = [[ViewController alloc]init];
        [VC btStatusform];
        [CbCentralManager stopScan];
            

        }
   

}

//블루투스 탐색 시작
+(void)beginScanningForDevice
{
 // Create a Core Bluetooth Central Manager object
 
     [CbCentralManager scanForPeripheralsWithServices:nil options:nil];
        CbCentralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
    
     
}


+(void)stopForDevice
{
 // Create a Core Bluetooth Central Manager object
 
    [CbCentralManager stopScan];

}

+(void)get_device:(NSString *)name
{
    NSString *getDevcename;
    getDevcename = name;
    
    if(getDevcename !=nil)
    {
        [getDivce addObject:getDevcename];
      
        NSOrderedSet *userSet = [[NSOrderedSet alloc] initWithArray:getDivce];

    getDivce = [[NSMutableArray alloc] initWithArray:[userSet array]];
        
    }
    
}



//데이터 받기
+(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    if (error)
    {
        NSLog(@"Error reading characteristics: %@", [error localizedDescription]); return;
    }
    
    if(characteristic.value !=nil)
    {
        
        
   NSLog(@"characteristic.value : %@" ,characteristic.value); //0x01(일반), 0x02(침수상태) 날라온다.
        NSLog(@"characteristic.value.description : %@" ,characteristic.value.description); NSString *peripheralSendSign = characteristic.value.description; if([peripheralSendSign containsString:@"0x02"]){ NSLog(@"침수상황 sos!!"); //긴급신고 화면 호출
           //주변기기가 던저 주는 데이터 종료 시키기 -
            
        }else if([peripheralSendSign containsString:@"0x01"]){ NSLog(@"연결상황");
            
        }
        
    }
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
      
    NSLog(@"centralManagerDidUpdateState");
}

@end





