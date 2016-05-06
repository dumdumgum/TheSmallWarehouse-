//
//  YLLHeader.h
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/2/27.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#ifndef YLLHeader_h
#define YLLHeader_h

#define kWhiteColor [UIColor whiteColor]
#define kColor [UIColor colorWithRed:200/256.0 green:250/256.0 blue:230/256.0 alpha:1]
#define kColorTwo [UIColor colorWithRed:0/256.0 green:115/256.0 blue:65/256.0 alpha:1]
#define kColorThree [UIColor colorWithRed:215/256.0 green:250/256.0 blue:235/256.0 alpha:1]
#define kGrayColor [UIColor colorWithRed:236/256.0 green:236/256.0 blue:236/256.0 alpha:1]

#define kFrameBOne CGRectMake(5, kHeight * 0.01, (kWidth - 10) / 4.0, kHeight * 0.04)
#define kFrameBTwo CGRectMake(5 + (kWidth - 10) / 4.0, kHeight * 0.01, (kWidth - 10) / 4.0, kHeight * 0.04)
#define kFrameBThree CGRectMake(5 + 2*(kWidth - 10) / 4.0, kHeight * 0.01, (kWidth - 10) / 4.0, kHeight * 0.04)
#define kFrameBFour CGRectMake(5 + 3*((kWidth - 10) / 4.0), kHeight * 0.01, (kWidth - 10) / 4.0, kHeight * 0.04)

#define kFrameBFive CGRectMake(5 + 2*(kWidth - 10) / 4.0, kHeight * 0.01, (kWidth - 10) / 4.0, kHeight * 0.04)
#define kFrameBSix CGRectMake(5 + (kWidth - 10) / 4.0, kHeight * 0.01, (kWidth - 10) / 4.0, kHeight * 0.04)

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#endif /* YLLHeader_h */
