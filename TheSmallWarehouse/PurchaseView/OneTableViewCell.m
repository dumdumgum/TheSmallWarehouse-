//
//  OneTableViewCell.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/4.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "OneTableViewCell.h"
#import "YLLHeader.h"
#import "GoodsModel.h"

@interface OneTableViewCell ()<UITextFieldDelegate>

@end

@implementation OneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 80, 40)];
        [self addSubview:self.lable];
        self.textFiled = [[UITextField alloc] initWithFrame:CGRectMake(100, 7.5, 200, 25)];
        self.textFiled.font = [UIFont systemFontOfSize:12];
        self.textFiled.layer.cornerRadius = 10;
        //使textfiled得文字往右移动。。。
        self.textFiled.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 25)];
        self.textFiled.leftViewMode = UITextFieldViewModeAlways;
        
        self.textFiled.layer.backgroundColor = kGrayColor.CGColor;
        self.textFiled.enablesReturnKeyAutomatically = NO;
        self.textFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.textFiled.delegate = self;
        [self.textFiled addTarget:self action:@selector(textFiledChanged:) forControlEvents:(UIControlEventEditingChanged)];
        [self addSubview:self.textFiled];
    }
    return self;
}

//监听文本变化，给模型赋值
- (void)textFiledChanged:(UITextField *)textField
{
    NSString *text = textField.text;
    
    NSString *labelText = self.lable.text;
    
    /*
     @property (nonatomic,strong) NSString *name;
     @property (nonatomic,strong) NSString *price;//采购价
     @property (nonatomic,strong) NSString *priceTwo;//批发价
     @property (nonatomic,strong) NSString *sellPrice;//零售价
     @property (nonatomic,strong) NSString *goodID;//货号
     @property (nonatomic,strong) NSString *goodsColor;
     @property (nonatomic,strong) NSString *goodsSize;
     @property (nonatomic,strong) NSString *goodsNum;//货物数量
     @property (nonatomic,strong) NSData *imageData;
     @property (nonatomic,strong) NSString *gongYingShang;//供应商
     @property (nonatomic,strong) NSString *warehouse;
     @property (nonatomic,strong) NSString *fukuan;//付款
     @property (nonatomic,strong) NSString *date;//日期
     */
    
    !self.textChangedBlock?:self.textChangedBlock(labelText,text);
    
    //判断是哪个cell
    if ([labelText hasPrefix:@"名称"]) {
        self.goodModel.name = text;
        
    } else if ([labelText hasPrefix:@"货号"]) {
        self.goodModel.goodID = text;
        
    } else if ([labelText hasPrefix:@"采购"]) {
        self.goodModel.price = text;
        
    } else if ([labelText hasPrefix:@"批发"]) {
        self.goodModel.priceTwo = text;
        
    } else if ([labelText hasPrefix:@"零售"]) {
        self.goodModel.sellPrice = text;
        
    } else if ([labelText hasPrefix:@"颜色"]) {
        self.goodModel.goodsColor = text;
        
    } else if ([labelText hasPrefix:@"尺码"]) {
        self.goodModel.goodsSize = text;
        
    } else if ([labelText hasPrefix:@"货物"]) {
        self.goodModel.goodsNum = text;
        
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
