//
//  ImageDetails.m
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 31/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import "ImageDetails.h"

@interface ImageDetails ()

@end

@implementation ImageDetails{
    
    NSMutableArray *dataArr;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeClick];

    dataArr = (NSMutableArray*)context;
    if (([dataArr valueForKey:@"description"]==[NSNull null]))
    {
        [self.imageTitle setText: @"Title Not Available"];
        
        
    }else{
        
        [self.imageTitle setText: [dataArr valueForKey:@"description"]];
        
        
    }
    if (([dataArr valueForKey:@"camera"] ==[NSNull null]))
    {
        [self.cameraDetail setText: @"Camera Details Not Available"];
        
        
    }else{
        
        [self.cameraDetail setText: [dataArr valueForKey:@"camera"]];
        
        
    }
    if (([dataArr valueForKey:@"taken_at"]==[NSNull null]))
        
    {
        [self.imageDate setText: @"Date Not Available"];
        
        
    }else{
        NSString *date = [[dataArr valueForKey:@"taken_at"] substringToIndex:10];
        
        [self.imageDate setText: date];
        
    }
    if ([dataArr valueForKey:@"votes_count"]==[NSNull null])
    {
        [self.votes setText: @"Votes Not Available"];
        
        
    }else{
        
        
        [self.votes setText:[[dataArr valueForKey:@"votes_count"] stringValue]];
        
    }
    if ([dataArr valueForKey:@"rating"]==[NSNull null])
    {
        [self.rating setText: @"Rating Not Available"];
        
        
    }else{
        NSString *rating = [[[dataArr valueForKey:@"rating"] stringValue] substringToIndex:2];
        [self.rating setText: rating];
        
        
    }
    if ([dataArr valueForKey:@"times_viewed"]==[NSNull null])
    {
        
        [self.views setText: @"Views Not Available"];
        
        
    }else{
        
        [self.views  setText: [[dataArr valueForKey:@"times_viewed"] stringValue]];
        
        
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



