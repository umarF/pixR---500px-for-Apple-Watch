//
//  ProfileDetails.h
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 31/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface ProfileDetails : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *username;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *fullname;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *city;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *userimage;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *profile;

@end
