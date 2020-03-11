#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "CreamoBleClient.h"

@interface ViewController : UIViewController <CBCentralManagerDelegate, CBPeripheralDelegate, UITextViewDelegate, CreamoBleServer>

    



@property (strong, nonatomic) CBCentralManager *centralManager;
@property (strong, nonatomic) CBPeripheral *discoveredPeripheral;
@property (strong, nonatomic) NSDictionary *data;




@end
