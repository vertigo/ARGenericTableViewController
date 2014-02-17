//
//  ExampleGenericTableViewController.m
//  ARGenericTableView
//
//  Created by Jonas Stubenrauch on 04.04.13.
//  Copyright (c) 2013 arconsis IT-Solutions GmbH. All rights reserved.
//

#import "ExampleGenericTableViewController.h"
#import "CustomCell.h"

@implementation ExampleGenericTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.animateChanges = YES;

    ARTableViewData *tableViewData = [[ARTableViewData alloc] initWithSectionDataArray:@[[self sampleSectionData]]];

    // add the section to the tableView
    [tableViewData addSectionData:[self customCellSectionData]];

    // setting the tableViewData property will automaticaly reload the tableView
    self.tableViewData = tableViewData;
}

- (ARSectionData *)sampleSectionData
{
    // configure the section
    ARSectionData *sectionData = [[ARSectionData alloc] init];
    sectionData.headerTitle = @"Header";
    sectionData.footerTitle = @"Footer";


    // configure the cell
    for (int i = 0; i < 3; i++) {
        ARCellData *cellData = [[ARCellData alloc] initWithIdentifier:@"Cell"];
        cellData.editable = YES;
        cellData.height = 44 + 10 * i;

        [cellData setCellConfigurationBlock:^(UITableViewCell *cell) {
            // called in cellForRowAtIndexpath
            cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", i];
        }];

        [cellData setCellSelectionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            // called in didSelectRowAtIndexPath
            UIAlertView *alert = [[UIAlertView alloc] init];
            alert.title = [NSString stringWithFormat:@"Cell %d", i];
            [alert addButtonWithTitle:@"OK"];
            [alert show];
        }];

        [sectionData addCellData:cellData];
    }

    return sectionData;
}

- (ARSectionData *)customCellSectionData
{
    // configure the section
    ARSectionData *sectionData = [[ARSectionData alloc] init];
    sectionData.headerTitle = @"Custom Cells";


    // configure the cell
    for (int i = 0; i < 4; i++) {
        ARCellData *cellData = [[ARCellData alloc] initWithIdentifier:@"CustomCell"];

        [cellData setCellConfigurationBlock:^(CustomCell *cell) {
            // called in cellForRowAtIndexpath
            cell.customLabel.text = [NSString stringWithFormat:@"Custom Cell %d", i];
            cell.customSwitch.on = i % 2;
        }];

        [cellData setCellSelectionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            // called in didSelectRowAtIndexPath
            UIAlertView *alert = [[UIAlertView alloc] init];
            alert.title = [NSString stringWithFormat:@"Custom Cell %d", i];
            [alert addButtonWithTitle:@"OK"];
            [alert show];
        }];

        [sectionData addCellData:cellData];
    }

    return sectionData;
}


@end
