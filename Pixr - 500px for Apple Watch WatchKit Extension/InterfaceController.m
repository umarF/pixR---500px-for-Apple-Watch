//
//  InterfaceController.m
//  Pixr - 500px for Apple Watch WatchKit Extension
//
//  Created by Umar Farooque on 13/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import "InterfaceController.h"
#import "ImageCellClass.h"
#import "Constants.h"

@interface InterfaceController()

@end


@implementation InterfaceController{
    
    
    NSMutableArray *responseArr;
    int pageCount;
    int totalPage;
    int nextPage;
    NSString *reqType;
    NSString *category;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    [self.loadingView setHidden:NO];
    [self.showMore setHidden:YES];
    // Configure interface objects here.
    NSMutableDictionary *dic =(NSMutableDictionary*)context;
    category = [dic valueForKey:@"category"];
    reqType =@"popular";
    nextPage=1;
    [self loadData:nextPage andreqType:reqType andCategory:category];
    
   
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}




- (void)prepareImageRow {

    NSMutableArray *localArr = [[NSMutableArray alloc] init];
    
    for (int i =0; i<responseArr.count; i++) {
    
        if ([[[[responseArr valueForKey:@"photos"] objectAtIndex:i] valueForKey:@"nsfw"] integerValue] == 0) {
            
            [localArr addObject: [[responseArr valueForKey:@"photos"] objectAtIndex:i] ];
            
        }
        
        
    }
    

    [self.myTable setNumberOfRows:localArr.count withRowType:@"myCellRow"];
    for (int i =0; i<localArr.count; i++) {
        ImageCellClass *table = [self.myTable rowControllerAtIndex:i];
        [table.myImageView setHidden:NO];
        [table.proxyImageView setHidden:YES];

        
         NSString *ImageURL = [[localArr objectAtIndex:i] valueForKey:@"image_url"];
        
        dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(q, ^{
            /* Fetch the image from the server... */
            NSURLSession *session = [NSURLSession sharedSession];
            [[session dataTaskWithURL:[NSURL URLWithString:ImageURL]
                    completionHandler:^(NSData *data,
                                        NSURLResponse *response,
                                        NSError *error) {
                        
                        if (error!=nil) {
                            
                            [self.loadingLabel setText:@"An error has occured, try again!"];

                        }
                        else{
                            
                            // handle response
                            dispatch_async(dispatch_get_main_queue(), ^{
                                /* This is the main thread again, where we set the tableView's image to
                                 be what we just fetched. */
                                
                                [self.loadingView setHidden:YES];
                                [self.loadingLabel setHidden:YES];
                                [table.myImageView setHidden:YES];
                                [table.proxyImageView setHidden:NO];
                                [table.proxyImageView setImage: [UIImage imageWithData:data]];
                                //[table.myImageView setImage: [UIImage imageWithData:data]];
                                
                            });
                            
                            
                        }

                        
                    }] resume];

            
            });
        
    }
    [self.showMore setHidden:NO];

}

-(void)loadData:(int)pageIndex andreqType :(NSString*)reqTypes andCategory:(NSString*) cat{
    
    NSString* subCategory;
    
    //for first request
    if (pageIndex==1) {
        
        //add check for category type
        if ([cat isEqualToString:@"Black and White"]) {
            
            subCategory = @"5";
        }
        else if ([cat isEqualToString:@"City and Architecture"]) {
            
            subCategory = @"9";
        }
        else if ([cat isEqualToString:@"Fine Art"]) {
            
            subCategory = @"24";
        }
        else if ([cat isEqualToString:@"Performing Arts"]) {
            
            subCategory = @"19";
        }
        else if ([cat isEqualToString:@"Still Life"]) {
            
            subCategory = @"6";
        }
        else if ([cat isEqualToString:@"Urban Exploration"]) {
            
            subCategory = @"27";
        }
        else{
            
            
            subCategory = cat;
            
            
            
        }
        //string with page number
        NSString *pageString = [[NSString alloc] initWithFormat:@"https://api.500px.com/v1/photos?feature=%@&consumer_key=%@&image_size=440&page=%d&only=%@",reqTypes,CONSUMER_key,pageIndex,subCategory];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:[NSURL URLWithString:pageString]
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    
                    
                    if (error!=nil) {
                        
                        [self.loadingLabel setText:@"An error has occured, try again!"];

                    
                    }
                    
                    else {
                        
                        
                        // handle response
                        [self.loadingView setHidden:YES];
                        [self.loadingLabel setHidden:YES];
                        NSMutableArray *arr = [[NSMutableArray alloc] init];
                        arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                        responseArr = [[NSMutableArray alloc] init];
                        responseArr=arr;
                        NSLog(@"DATA Array: %@",arr);
                        
                        //load cells
                        [self prepareImageRow];
                        
                        
                    }
                    
                    
                }] resume];
        
        
        

        
    }
    //add check for stoping or not loading data on last page
    else if (pageIndex<[[responseArr valueForKey:@"total_pages"] integerValue]) {
        
        //add check for category type
        if ([cat isEqualToString:@"Black and White"]) {
            
            subCategory = @"5";
        }
        else if ([cat isEqualToString:@"City and Architecture"]) {
            
            subCategory = @"9";
        }
        else if ([cat isEqualToString:@"Fine Art"]) {
            
            subCategory = @"24";
        }
        else if ([cat isEqualToString:@"Performing Arts"]) {
            
            subCategory = @"19";
        }
        else if ([cat isEqualToString:@"Still Life"]) {
            
            subCategory = @"6";
        }
        else if ([cat isEqualToString:@"Urban Exploration"]) {
            
            subCategory = @"27";
        }
        else{
            
            
            subCategory = cat;
            
            
            
        }
        //string with page number
        NSString *pageString = [[NSString alloc] initWithFormat:@"https://api.500px.com/v1/photos?feature=%@&consumer_key=%@&image_size=440&page=%d&only=%@",reqTypes,CONSUMER_key,pageIndex,subCategory];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:[NSURL URLWithString:pageString]
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    
                    if (error!=nil) {
                        
                        
                        [self.loadingLabel setText:@"An error has occured, try again!"];
                        
                    
                    
                    }
                    
                    else
                    {
                        // handle response
                    [self.loadingView setHidden:YES];
                    [self.loadingLabel setHidden:YES];
                    NSMutableArray *arr = [[NSMutableArray alloc] init];
                    arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                    responseArr = [[NSMutableArray alloc] init];
                    responseArr=arr;
                    NSLog(@"DATA Array: %@",arr);
                    
                    //load cells
                    [self prepareImageRow];
                    
                    }
                    
                    
                }] resume];
        
        
        

        
    }else{
        
        
        //hide show  more option or something
        [self.showMore setTitle:@"That's All !"];
        
        
        
    }
    
    
    
    
    
}


-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex{
    
    //push to detail with full screen image and link or image id inorder to get high resolution image
    
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeClick];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc] init];
    [paramDict setObject:[[[responseArr valueForKey:@"photos"] objectAtIndex:rowIndex] valueForKey:@"id"] forKey:@"imageID"];
    dispatch_async(dispatch_get_main_queue(), ^{
    
        
        [self presentControllerWithNames:[NSArray arrayWithObjects:@"imageDetails",@"profileDetails",@"technicalDetails", nil] contexts:[NSArray arrayWithObjects:[[responseArr valueForKey:@"photos"] objectAtIndex:rowIndex],[[responseArr valueForKey:@"photos"] objectAtIndex:rowIndex],[[responseArr valueForKey:@"photos"] objectAtIndex:rowIndex], nil]];

    
    
    });
    
    
    //    [self pushControllerWithName:@"detailImage" context:paramDict];

}


- (IBAction)showMoreAction {
    
    [self.showMore setHidden:YES];
    nextPage++;
    //pass in parameter to loadData method with incremented page count
    [self loadData:nextPage andreqType:reqType andCategory:category];
}


- (IBAction)popularAction {
    
    reqType = @"popular";
    [self loadData:nextPage andreqType:reqType andCategory:category];

    
}

- (IBAction)trendingAction {
    
    reqType = @"upcoming";
    [self loadData:nextPage andreqType:reqType andCategory:category];

    
    
}
- (IBAction)editorAction {
    
    reqType = @"editors";
    [self loadData:nextPage andreqType:reqType andCategory:category];

    
    
}
- (IBAction)freshAction {
    
    reqType = @"fresh_today";
    [self loadData:nextPage andreqType:reqType andCategory:category];

    
    
}

@end



