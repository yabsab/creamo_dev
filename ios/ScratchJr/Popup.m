//
//  Popup.m
//  ScratchJr
//
//  Created by Yazz on 2020/03/31.
//  Copyright © 2020 Playful Invention Company. All rights reserved.
//

#import "Popup.h"
#import "CreamoBleClient.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import <Foundation/Foundation.h>
#import "ViewController.h"



/*
 블루투스 팝업 뷰
 개발 : 안재용
 e-mail : sk8yabsab@gmail.com
 날짜 : 2020년03월30일
 */




UIView*    btView;
UITableView* btTableView;
NSDictionary* blueDevice;
UIButton *btBluetoothlist;


@implementation Popup



- (IBAction)Bt_List:(id)sender
{
    NSLog(@"btlist");
    [self closeNib];
}



- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    
     [self loadNib];
    
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
   
    }
     [self loadNib];
    
    return self;
}


- (void) loadNib
{
    NSBundle*    bundle    =    [NSBundle bundleForClass:self.class];
    btView =    [bundle loadNibNamed:@"PopupView" owner:self options:nil].firstObject;
    
    self.btTableView.dataSource = self;
    self.btTableView.delegate =self;
    
    btTableView.backgroundColor = [UIColor whiteColor];
    
     [self addSubview:btView];
    
    btView.frame    =    self.bounds;

}

-(void) closeNib
{

    ViewController *main = [[ViewController alloc]init];
    [main closePopup];
    [CreamoBleClient stopForDevice];
    
}


- (void)drawRect:(CGRect)rect
{
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return 5;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.textColor = [UIColor blackColor];
    


    cell.textLabel.text = [NSString stringWithFormat:@"This is row %ld", (long)indexPath.row];


    return cell;
    
    
}

-(NSDictionary *)getDeviceName:(NSDictionary *)blueDevice
{
    
    
    return blueDevice;
    
    
}


@end
