//
//  WXFMDeviceSdkModule.m
//  duoxiang
//
//  Created by 李德明 on 13/04/2018.
//  Copyright © 2018 Hitter. All rights reserved.
//

#import "WXTongdunSdkModule.h"
#import "FMDeviceManager.h"

@implementation WXTongdunSdkModule

@synthesize weexInstance;

/// 初始化(可以多次初始化,拿最新的数据,但初始化一般都要1-3秒中时间,在下一次初始化之前,拿到的数据都是一样的)
/// app在起启时已初始化,可以直接取设备信息
/// 详情SDK中有说明
/// 初始化成功后通过block返回设置信息
WX_EXPORT_METHOD(@selector(config:))

/*
 * 初始化之后，如果希望获取SDK的运行状态，可以通过此接口查询：
 *     @"collecting"：设备信息采集中
 *     @"profiling"：设备信息采集完毕，正在上传
 *     @"successful"：SDK初始化成功，此时可以获取到正常的blackBox
 *     @"failed"：上传失败
 *     @"uninit"：尚未调用init方法，此时不可获取blackBox
 * 只有successful状态可以获取到正常的blackBox，在其他状态(除uninit外)
 * 调用getDeviceInfo接口将获取到降级的blackBox
 */
WX_EXPORT_METHOD_SYNC(@selector(configStatus))

/// 获取设置信息
WX_EXPORT_METHOD_SYNC(@selector(deviceInfo))

- (void)config:(WXModuleKeepAliveCallback)callback {
    // 获取设备管理器实例
    FMDeviceManager_t *manager = [FMDeviceManager sharedManager];
    
    // 准备SDK初始化参数
    NSMutableDictionary *options = [NSMutableDictionary dictionary];
    
#if DEBUG
    /*
     * SDK具有防调试功能，当使用xcode运行时(开发测试阶段),请取消下面代码注释，
     * 开启调试模式,否则使用xcode运行会闪退。上架打包的时候需要删除或者注释掉这
     * 行代码,如果检测到调试行为就会触发crash,起到对APP的保护作用
     */
    // 上线Appstore的版本，请记得删除此行，否则将失去防调试防护功能！
    [options setValue:@"allowd" forKey:@"allowd"];  // TODO
    
    // 指定对接同盾的测试环境，正式上线时，请删除或者注释掉此行代码，切换到同盾生产环境
    [options setValue:@"sandbox" forKey:@"env"]; // TODO
#endif
    
    // 此处已经替换为您的合作方标识了
    [options setValue:@"qianpen" forKey:@"partner"];
    
    if (callback) {
        void (^callbackdata)(NSString *blackBox)=^(NSString *blackBox){
            callback(@{@"success":@(YES),@"data":blackBox},NO);
        };
        [options setObject:callbackdata forKey:@"callback"];
    }
    
    // 使用上述参数进行SDK初始化
    manager->initWithOptions(options);
}

- (NSString *)configStatus {
    return [FMDeviceManager sharedManager]->getInitStatus();
}

- (NSString *)deviceInfo{
    return [FMDeviceManager sharedManager]->getDeviceInfo();
}

@end
