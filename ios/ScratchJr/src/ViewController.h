#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "CreamoBleClient.h"


@interface ViewController : UIViewController <CBCentralManagerDelegate, CBPeripheralDelegate, UITextViewDelegate>

    

-(void)closePopup;
-(void)btStatusform;
@property (strong, nonatomic) CBCentralManager *centralManager;
@property (strong, nonatomic) CBPeripheral *discoveredPeripheral;
@property (strong, nonatomic) NSDictionary *data;

@property(nonatomic,retain)UIPopoverPresentationController *bluetoothlist;

@end
