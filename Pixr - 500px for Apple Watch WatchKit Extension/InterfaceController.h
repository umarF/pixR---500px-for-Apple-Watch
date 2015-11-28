//
//  InterfaceController.h
//  Pixr - 500px for Apple Watch WatchKit Extension
//
//  Created by Umar Farooque on 13/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *myTable;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *showMore;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *loadingView;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *loadingLabel;

@end
