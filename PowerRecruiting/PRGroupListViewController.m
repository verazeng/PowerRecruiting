//
//  PRGroupViewController.m
//  PowerRecruiting
//
//  Created by Heng Zeng on 6/20/14.
//  Copyright (c) 2014 twzengheng. All rights reserved.
//

#import "PRGroupListViewController.h"
#import "PRGroupManager.h"
#import "PRGroupInfo.h"

@interface PRGroupListViewController ()
@property (strong, nonatomic) IBOutlet UITableView *groupsTableView;

@end

@implementation PRGroupListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Group List";
    
    _groupsTableView.delegate = self;
    _groupsTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSIndexPath *indexpath = [_groupsTableView indexPathForSelectedRow];
    if (indexpath) {
        [_groupsTableView deselectRowAtIndexPath:indexpath animated:YES];
        [self.groupsTableView reloadData];
    }
}

#pragma tableview datesource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [PRGroupManager shareIntance].groupListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifierCell = @"GroupCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifierCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    PRGroupInfo *groupInfo = [[PRGroupManager shareIntance].groupListArray objectAtIndex:indexPath.row];
    cell.textLabel.text = groupInfo.name;
    cell.detailTextLabel.text = [groupInfo getProgressDescription];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
@end
