//
//  TechnicalDetails.h
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 31/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface TechnicalDetails : WKInterfaceController

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *aperture;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *focallength;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *iso;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *shutter;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *lens;
@end
