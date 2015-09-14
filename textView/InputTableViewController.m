//
//  InputTableViewController.m
//  textView
//
//  Created by tiger on 15/6/30.
//  Copyright (c) 2015年 guanjia. All rights reserved.
//

#import "InputTableViewController.h"
#import "inputTableViewCell.h"

@interface InputTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) inputTableViewCell *cell;
@end

@implementation InputTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_cell == nil) {
        _cell = [[[NSBundle mainBundle] loadNibNamed:@"inputTableViewCell" owner:self options:nil] objectAtIndex:0];
        self.cell.textView.delegate = self;
    }
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"inputTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = self.cell;
    }
    
    return cell;
}

#pragma mark private methods
- (CGFloat)heightForTextView:(UITextView*)textView containingString:(NSString*)string {
    
    CGFloat widthOfTextView = self.cell.textView.contentSize.width - 16;
    CGFloat height;
    if ( [[[UIDevice currentDevice] systemVersion] floatValue] > 6.0) {
        
        height = [string boundingRectWithSize:CGSizeMake(widthOfTextView, 9999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}  context:nil].size.height + 16.0f;
    } else {
        height = [string sizeWithFont:[UIFont systemFontOfSize:16.0] constrainedToSize:CGSizeMake(widthOfTextView, 999999.0f) lineBreakMode:NSLineBreakByWordWrapping].height + 16;
        
    }
    return height;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if(indexPath.section == 0 && indexPath.row == 0){
        if (self.cell.textView.contentSize.height >= 36) {
            float height = [self heightForTextView:self.cell.textView containingString:self.cell.textView.text];
            return height+8;
            
        }else {
            return self.tableView.rowHeight;
        }
    } else {
        return self.tableView.rowHeight;
    }
    
}
#pragma mark UITextViewDelegate
- (void) textViewDidChange:(UITextView *)textView {
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
}
@end
