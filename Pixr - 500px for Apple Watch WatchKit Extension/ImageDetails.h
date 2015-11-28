//
//  ImageDetails.h
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 31/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface ImageDetails : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *imageTitle;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *imageDate;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *cameraDetail;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *votes;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *rating;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *views;

@end
