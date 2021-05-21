//
//  XXADManager.m
//  AD
//
//  Created by Davetech on 2021/5/19.
//

#import "XXADManager.h"
#import "XXADDefine.h"
//#import <GDTMobSDK/GDTSDKConfig.h>

@interface XXADManager ()
@property (strong, nonatomic) XXADConfigModel * configModel;
@end

@implementation XXADManager
static XXADManager *shareInstance = nil;

#pragma mark - Singleton
+ (XXADManager *)sharedManager{
    @synchronized (self) {
        if (shareInstance == nil) {
            shareInstance = [[self alloc] init];
        }
    }
    return shareInstance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized (self) {
        if (shareInstance == nil) {
            shareInstance = [super allocWithZone:zone];
        }
    }
    return shareInstance;
}
- (id)copy{
    return shareInstance;
}

#pragma mark - Singleton
- (void)registerAD{
    //读取网络json
    NSURL * jsonUrl = [NSURL URLWithString:@"http://download.jialanvip.com/jkh.json"];
    NSData * jsonData = [[NSData alloc]initWithContentsOfURL:jsonUrl];
    // 对数据进行JSON格式化并返回字典形式
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    NSLog(@"success:广告配置信息\n%@", dic[@"ios"][@"type"]);
    
    XXADConfigModel * configModel = [[XXADConfigModel alloc]init];
    configModel.type = dic[@"type"];
    configModel.media_id = dic[@"media_id"];
    configModel.information = dic[@"information"];
    configModel.open_screen = dic[@"open_screen"];
    configModel.video = dic[@"video"];
    self.configModel = configModel;
    
    [self selectRegister];
    
}
- (void)selectRegister{
//    if (self.configModel.type.intValue == 1) {
//        BOOL result = [GDTSDKConfig registerAppId:K_GDT_AppID];
//        if (result) {
//            NSLog(@"success: 广点通广告---注册成功");
//        }
//    } else {
//        NSLog(@"error: 未获取到广告类型");
//        BOOL result = [GDTSDKConfig registerAppId:K_GDT_AppID];
//        if (result) {
//            NSLog(@"success: 广点通广告---注册成功");
//        }
//    }

}
@end

@implementation XXADConfigModel

@end
