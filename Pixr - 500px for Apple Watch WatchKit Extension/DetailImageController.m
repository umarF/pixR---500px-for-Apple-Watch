//
//  DetailImageController.m
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 21/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import "DetailImageController.h"

@interface DetailImageController ()

@end

@implementation DetailImageController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    

    NSString *imageID = [context valueForKey:@"imageID"];
    NSString *imageURL = [NSString stringWithFormat:@"https://api.500px.com/v1/photos?%@&consumer_key=YOUR_CONSUMER_KEY_500PX",imageID];
    
        /* Fetch the image from the server... */
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:[NSURL URLWithString:imageURL]
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    
                    // handle response
//                    dispatch_async(dispatch_get_main_queue(), ^{
                        /* This is the main thread again, where we set the tableView's image to
                         be what we just fetched. */
                        NSMutableArray *arr = [[NSMutableArray alloc] init];
                        arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                        NSLog(@"ARR:\n%@",arr);
                        [self.detailImageView setImage: [UIImage imageWithData:data]];
                    
//                    });
                    
                }] resume];
        
        
//    });






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



