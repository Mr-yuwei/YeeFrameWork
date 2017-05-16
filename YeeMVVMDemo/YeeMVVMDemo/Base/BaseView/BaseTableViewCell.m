//
//  BaseTableViewCell.m
//  YeeMVVMDemo
//
//  Created by CoderYee on 2017/5/16.
//  Copyright © 2017年 CodeYee. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      
        if ([self rac_signalForSelector:@selector(addOwnView)]){
            
            [self addOwnView];
        }
        if ([self rac_signalForSelector:@selector(layoutOwnView)]){
            
            [self layoutOwnView];
        }
        if ([self rac_signalForSelector:@selector(bindViewModel)]){
            
            [self bindViewModel];
        }
    }
    return self;
}
-(void)addOwnView{
    
    
}

-(void)layoutOwnView{
    
    
}

-(void)bindViewModel{
    
    
}

+ (NSString *)cellIdentifier{
    
    return NSStringFromClass([self class]);
}

-(void)configTableView:(UITableView *)tableView withModel:(BaseModel*)model{
 
    
}
-(void)configTableCellindexPath:(NSIndexPath*)indexPath{
    
    
}
@end
