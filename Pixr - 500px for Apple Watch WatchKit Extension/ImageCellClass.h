//
//  ImageCellClass.h
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 13/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>


@interface ImageCellClass : NSObject
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *myImageView;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *proxyImageView;

@end
