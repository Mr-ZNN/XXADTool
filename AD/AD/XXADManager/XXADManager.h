//
//  XXADManager.h
//  AD
//
//  Created by Davetech on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface XXADManager : NSObject

@end

@interface XXADConfigModel : NSObject
/// 广告类型（1:优量汇）
@property (copy, nonatomic) NSString * type;
/// 广告app_id
@property (copy, nonatomic) NSString * media_id;
/// 信息流广告位id
@property (copy, nonatomic) NSString * information;
/// 开屏广告位id
@property (copy, nonatomic) NSString * open_screen;
/// 激励视频广告位id
@property (copy, nonatomic) NSString * video;
@end
NS_ASSUME_NONNULL_END
