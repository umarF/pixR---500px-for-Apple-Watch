//
//  MainMenuViewController.m
//  Pixr - 500px for Apple Watch
//
//  Created by Umar Farooque on 27/08/15.
//  Copyright © 2015 Umar Farooque. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuCell.h"
@interface MainMenuViewController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *mainMenuTable;

@end

@implementation MainMenuViewController{
    
    NSMutableArray *list;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    list = [[NSMutableArray alloc] initWithObjects:@"Abstract",@"Animals",@"Black and White",@"City and Architecture",@"Commercial",@"Concert",@"Family",@"Film",@"Food",@"Journalism",@"Landscapes",@"Macro",@"Nature",@"Sport",@"Street",@"Transportation",@"Travel",@"Underwater", nil];
    
    
    [self prepareRow];
    
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
}


- (void)prepareRow {
    
    [self.mainMenuTable setNumberOfRows:list.count withRowType:@"menuCell"];
    for (int i =0; i<list.count; i++) {
        MainMenuCell *mCell = [self.mainMenuTable rowControllerAtIndex:i];
        [mCell.categoryLabel setText:list[i]];
        

    }
}

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex{
    
    //push to detail with full screen image and link or image id inorder to get high resolution image
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc] init];
    [paramDict setObject:list[rowIndex] forKey:@"category"];
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [self pushControllerWithName:@"imageTable" context:paramDict];
   
    });
    
}





@end
