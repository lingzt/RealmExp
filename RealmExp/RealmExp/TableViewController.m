//
//  TableViewController.m
//  RealmExp
//
//  Created by ling toby on 7/6/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "TableViewController.h"
#import "House.h"

@interface TableViewController ()
@property (nonatomic, strong) RLMResults *array;

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [[House allObjects] sortedResultsUsingProperty:@"guestName" ascending:YES];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"cell"];
    }
    
    House *house = self.array[indexPath.row];
    cell.textLabel.text = house.guestName;
    return cell;
}


//add to Realm
- (IBAction)AddHouse:(UIBarButtonItem *)sender {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm beginWriteTransaction];
    [House createInRealm:realm withValue:@[[self randomString]]];
    [realm commitWriteTransaction];
    [self.tableView reloadData];
}

- (NSString *)randomString
{
    return [NSString stringWithFormat:@"The guest is: %d", arc4random()];
}


//delect from Realm
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        RLMRealm *realm = RLMRealm.defaultRealm;
        [realm beginWriteTransaction];
        [realm deleteObject:self.array[indexPath.row]];
        [realm commitWriteTransaction];
    }
}


@end
