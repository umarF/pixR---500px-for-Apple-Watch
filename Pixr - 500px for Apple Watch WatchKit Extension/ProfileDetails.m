//
//  ProfileDetails.m
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 31/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import "ProfileDetails.h"

@interface ProfileDetails ()

@end

@implementation ProfileDetails{
    
    NSMutableArray *dataArr;
}


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeClick];

    
    dataArr = (NSMutableArray*)context;
    if (([[dataArr valueForKey:@"user"] valueForKey:@"username"]==[NSNull null]))
    {
        [self.city setText:[NSString stringWithFormat:@"Username Not Available"]];
        
        
    }else{
        
        [self.username setText:[NSString stringWithFormat:@"@%@",[[dataArr valueForKey:@"user"] valueForKey:@"username"]]];
        
    }
    
    
    if (([[dataArr valueForKey:@"user"] valueForKey:@"fullname"]==[NSNull null]))
    {
        [self.city setText:[NSString stringWithFormat:@"Fullname Not Available"]];
        
        
    }else{
        
        [self.fullname setText:[[dataArr valueForKey:@"user"] valueForKey:@"fullname"]];
        
        
    }
    
    
    if (([[dataArr valueForKey:@"user"] valueForKey:@"country"]==[NSNull null]))
    {
        [self.city setText:[NSString stringWithFormat:@"Location Not Available"]];
        
        
    }else{
        
        if ([[dataArr valueForKey:@"user"] valueForKey:@"city"]==[NSNull null]) {
            
            [self.city setText:[NSString stringWithFormat:@"%@",[[dataArr valueForKey:@"user"] valueForKey:@"country"]]];
            
        }else
        {
            if ([[[dataArr valueForKey:@"user"] valueForKey:@"city"] isEqualToString:@""]) {
                
                [self.city setText:[NSString stringWithFormat:@"Location Not Available"]];
                
            }else
                [self.city setText:[NSString stringWithFormat:@"%@, %@",[[dataArr valueForKey:@"user"] valueForKey:@"city"],[[dataArr valueForKey:@"user"] valueForKey:@"country"]]];
        }
        
        
        
    }
    
    
    
    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(q, ^{
        /* Fetch the image from the server... */
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:[NSURL URLWithString:[[dataArr valueForKey:@"user"] valueForKey:@"userpic_url"]]
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    // handle response
                    dispatch_async(dispatch_get_main_queue(), ^{
                        /* This is the main thread again, where we set the tableView's image to
                         be what we just fetched. */
                        
                        [self.profile setBackgroundImageData: data];
                        
                        
                    });
                    
                }] resume];
        
        
    });
    
    
    
    

 
    
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



