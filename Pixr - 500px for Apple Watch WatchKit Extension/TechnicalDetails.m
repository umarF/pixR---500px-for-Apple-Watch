//
//  TechnicalDetails.m
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 31/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import "TechnicalDetails.h"

@interface TechnicalDetails ()

@end

@implementation TechnicalDetails{
    
    NSMutableArray *dataArr;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeClick];

    
    dataArr = (NSMutableArray*)context;

    if (([dataArr valueForKey:@"aperture"]==[NSNull null])||([[dataArr valueForKey:@"aperture"] isEqualToString:@"<null>"])) {
        
        [self.aperture setText: [NSString stringWithFormat:@"Aperture\n%@", @"Not Available"]];
        
    }
    else{
        
        [self.aperture setText: [NSString stringWithFormat:@"Aperture\n%@", [dataArr valueForKey:@"aperture"]]];
        
        
    }
    
    if (([dataArr valueForKey:@"focal_length"]==[NSNull null])||([[dataArr valueForKey:@"focal_length"] isEqualToString:@"<null>"])) {
        
        [self.focallength setText: [NSString stringWithFormat:@"Focal length\n%@", @"Not Available"]];
        
    }
    else{
        
        [self.focallength setText: [NSString stringWithFormat:@"Focal length\n%@", [dataArr valueForKey:@"focal_length"]]];
        
        
    }
    
    
    if (([dataArr valueForKey:@"iso"]==[NSNull null])||([[dataArr valueForKey:@"iso"] isEqualToString:@"<null>"])) {
        
        [self.iso setText: [NSString stringWithFormat:@"ISO\n%@", @"Not Available"]];
        
    }
    else{
        
        [self.iso setText: [NSString stringWithFormat: @"ISO\n%@",[dataArr valueForKey:@"iso"]]];
        
        
    }
    
    
    if (([dataArr valueForKey:@"lens"]==[NSNull null])||([[dataArr valueForKey:@"lens"] isEqualToString:@"<null>"])) {
        
        [self.lens setText: [NSString stringWithFormat:@"Lens\n%@", @"Not Available"]];
        
    }
    else{
        
        [self.lens setText: [NSString stringWithFormat: @"Lens\n%@",[dataArr valueForKey:@"lens"]]];
        
        
    }
    
    
    if (([dataArr valueForKey:@"shutter_speed"]==[NSNull null])||([[dataArr valueForKey:@"shutter_speed"] isEqualToString:@"<null>"])) {
        
        [self.shutter setText: [NSString stringWithFormat:@"Shutter\n%@", @"Not Available"]];
        
    }
    else{
        
        [self.shutter setText:[NSString stringWithFormat:@"Shutter\n%@", [dataArr valueForKey:@"shutter_speed"]]];
        
        
    }
    
    

    

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



