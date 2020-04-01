//
//  Popup.h
//  ScratchJr
//
//  Created by Yazz on 2020/03/31.
//  Copyright © 2020 Playful Invention Company. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>




@interface Popup : UIView <UITableViewDelegate, UITableViewDataSource>

extern CBCentralManager *CbManager;
extern CBPeripheral *peripheral;
extern NSNumber *rssi;
extern NSDictionary *data;
extern CBCharacteristic *chardata;
extern NSError *errordata;



@property (weak, nonatomic) IBOutlet UIButton *btBluetoothlist;
@property (weak, nonatomic) IBOutlet UITableView *btTableView;
@property (strong, nonatomic) IBOutlet UIView *btView;

- (void) loadNib;
-(NSDictionary *)getDeviceName:(NSDictionary *)blueDevice;

@end



