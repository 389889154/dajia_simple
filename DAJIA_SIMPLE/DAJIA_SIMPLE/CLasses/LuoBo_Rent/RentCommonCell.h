//
//  RentCommonCell.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/28.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "ShBaseTableViewCell.h"
@class RentCommonCellModel;
// base

@interface RentBaseCell : ShBaseTableViewCell
@property (nonatomic, strong) NSString *model;
@end



// img+title+>
@interface RentCommonCell : ShBaseTableViewCell
@property (nonatomic, strong) RentCommonCellModel *model;
@end

// 客户信息
@interface RentCustomerCell : ShBaseTableViewCell

@end

// 房屋信息
@interface RentRoomCell : ShBaseTableViewCell

@end

// 订单信息
@interface RentOrderCell : ShBaseTableViewCell

@end

// 支付单信息
@interface RentPaymentCell : ShBaseTableViewCell

@end

