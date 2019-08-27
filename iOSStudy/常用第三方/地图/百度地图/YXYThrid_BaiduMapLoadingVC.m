//
//  YXYThrid_BaiduMapLoadingVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/5/27.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_BaiduMapLoadingVC.h"
#import "YXYPresentationRightController.h"
#import "YXYAlertViewController.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>


//复用annotationView的指定唯一标识
static NSString *annotationViewIdentifier = @"com.Baidu.BMKTransitRouteSearch";

//#import <Masonry/Masonry.h>
@interface YXYThrid_BaiduMapLoadingVC ()<BMKMapViewDelegate,BMKPoiSearchDelegate,UIViewControllerTransitioningDelegate,BMKRouteSearchDelegate>

@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) NSMutableArray *load_array;

@property (nonatomic, strong) BMKPoiSearch *poiSearch;

@end

@implementation YXYThrid_BaiduMapLoadingVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //当mapView即将被显示的时候调用，恢复之前存储的mapView状态
    [_mapView viewWillAppear];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //当mapView即将被隐藏的时候调用，存储当前mapView的状态
    [_mapView viewWillDisappear];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"百度地图";
    
    UIBarButtonItem *load_item = [[UIBarButtonItem alloc] initWithTitle:@"类型" style:(UIBarButtonItemStyleDone) target:self action:@selector(actionMoreLoad)];
    self.navigationItem.rightBarButtonItems = @[load_item];
    [self initMapView];
}
#pragma mark --------------------------网络处理--------------------------


#pragma mark --------------------------点击事件--------------------------
- (void)actionMoreLoad
{
    if (!_load_array) {
        _load_array = @[@{@"title":@"IPO检索加油站"}.mutableCopy,
                        @{@"title":@"市内公交路线"}.mutableCopy,
                        @{@"title":@"跨城公交路线"}.mutableCopy,
                        @{@"title":@"驾车路线"}.mutableCopy,
                        @{@"title":@"步行路线"}.mutableCopy,
                        @{@"title":@"骑行路线"}.mutableCopy,
                        @{@"title":@"室内路线"}.mutableCopy,
                        @{@"title":@"地图app驾车导航"}.mutableCopy,
                        @{@"title":@"地图app步行导航"}.mutableCopy,
                        @{@"title":@"地图app步行AR导航"}.mutableCopy,
                        @{@"title":@"地图app步行AR导航"}.mutableCopy,
                        @{@"title":@"位置分享"}.mutableCopy,
                        @{@"title":@"路线分享"}.mutableCopy,
                        @{@"title":@"运动轨迹"}.mutableCopy,
                        ].mutableCopy;
    }
    YXYAlertViewController *vc = [[YXYAlertViewController alloc] init];
    vc.preferredContentSize = CGSizeMake(100, [UIScreen mainScreen].bounds.size.height);
    vc.arrayData = _load_array;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
    vc.block = ^{
        for (NSMutableDictionary *dictM in self.load_array) {
            NSString *title = dictM[@"title"];
            BOOL isSel = [dictM[@"isSel"] boolValue];
            if ([title isEqualToString:@"IPO检索加油站"]) {
                if (isSel) {
                    //初始化请求参数类BMKCitySearchOption的实例
                    BMKPOICitySearchOption *cityOption = [[BMKPOICitySearchOption alloc]init];
                    //区域名称(市或区的名字，如北京市，海淀区)，最长不超过25个字符，必选
                    cityOption.city= @"杭州";
                    //检索关键字
                    cityOption.keyword = @"小吃";
                    ;
                    //                [self searchData:cityOption];
                    
                    self.poiSearch = [[BMKPoiSearch alloc] init];
                    self.poiSearch.delegate = self;
                    //初始化请求参数类BMKNearbySearchOption的实例
                    BMKPOINearbySearchOption *nearbyOption = [[BMKPOINearbySearchOption alloc] init];
                    //检索关键字，必选
                    nearbyOption.keywords = @[@"小吃"];
                    //检索中心点的经纬度，必选
                    nearbyOption.location = CLLocationCoordinate2DMake(40.051231, 116.282051);
                    //检索半径，单位是米。
                    nearbyOption.radius = 1000;
                    //检索分类，可选。
                    nearbyOption.tags = @[@"美食"];
                    //是否严格限定召回结果在设置检索半径范围内。默认值为false。
                    nearbyOption.isRadiusLimit = NO;
                    //POI检索结果详细程度
                    //nearbyOption.scope = BMK_POI_SCOPE_BASIC_INFORMATION;
                    //检索过滤条件，scope字段为BMK_POI_SCOPE_DETAIL_INFORMATION时，filter字段才有效
                    //nearbyOption.filter = filter;
                    //分页页码，默认为0，0代表第一页，1代表第二页，以此类推
                    nearbyOption.pageIndex = 0;
                    //单次召回POI数量，默认为10条记录，最大返回20条。
                    nearbyOption.pageSize = 10;
                    BOOL flag = [self.poiSearch poiSearchNearBy:nearbyOption];
                    if (flag) {
                        NSLog(@"POI周边检索成功");
                    } else {
                        NSLog(@"POI周边检索失败");
                    }
                } else {
                    [self.mapView removeAnnotations:self.mapView.annotations];
                }
            } else if([title isEqualToString:@"市内公交路线"]) {
                if (isSel) {
                    //初始化请求参数类BMKTransitRoutePlanOption的实例
                    BMKTransitRoutePlanOption *transitRoutePlanOption = [[BMKTransitRoutePlanOption alloc]init];
                    //实例化线路检索节点信息类对象
                    BMKPlanNode *start = [[BMKPlanNode alloc] init];
                    //起点名称
                    start.name = @"清华大学";
                    //实例化线路检索节点信息类对象
                    BMKPlanNode *end = [[BMKPlanNode alloc] init];
                    //终点名称
                    end.name = @"天安门";
                    //检索的起点，可通过关键字、坐标两种方式指定。cityName和cityID同时指定时，优先使用cityID
                    transitRoutePlanOption.from = start;
                    //检索的终点，可通过关键字、坐标两种方式指定。cityName和cityID同时指定时，优先使用cityID
                    transitRoutePlanOption.to = end;
                    //所在城市名称
                    transitRoutePlanOption.city = @"北京";
                    //初始化BMKRouteSearch实例
                    BMKRouteSearch * _transitRouteSearch = [[BMKRouteSearch alloc] init];
                    //设置公交路径规划的代理
                    _transitRouteSearch.delegate = self;
                    //实例化线路检索节点信息类对象
                    BMKPlanNode *start_0 = [[BMKPlanNode alloc]init];
                    //起点名称
                    start_0.name = transitRoutePlanOption.from.name;
                    //起点所在城市，注：cityName和cityID同时指定时，优先使用cityID
                    start_0.cityName = transitRoutePlanOption.from.cityName;
                    //起点所在城市ID，注：cityName和cityID同时指定时，优先使用cityID
                    if ((transitRoutePlanOption.from.cityName.length > 0 && transitRoutePlanOption.from.cityID != 0) || (transitRoutePlanOption.from.cityName.length == 0 && transitRoutePlanOption.from.cityID != 0))  {
                        start_0.cityID = transitRoutePlanOption.from.cityID;
                    }
                    //起点坐标
                    start_0.pt = transitRoutePlanOption.from.pt;
                    //实例化线路检索节点信息类对象
                    BMKPlanNode *end_0 = [[BMKPlanNode alloc]init];
                    //终点名称
                    end_0.name = transitRoutePlanOption.to.name;
                    //终点所在城市，注：cityName和cityID同时指定时，优先使用cityID
                    end_0.cityName = transitRoutePlanOption.to.cityName;
                    //终点所在城市ID，注：cityName和cityID同时指定时，优先使用cityID
                    if ((transitRoutePlanOption.to.cityName.length > 0 && transitRoutePlanOption.to.cityID != 0) || (transitRoutePlanOption.to.cityName.length == 0 && transitRoutePlanOption.to.cityID != 0))  {
                        end_0.cityID = transitRoutePlanOption.to.cityID;
                    }
                    //终点坐标
                    end_0.pt = transitRoutePlanOption.to.pt;
                    //初始化请求参数类BMKTransitRoutePlanOption的实例
                    BMKTransitRoutePlanOption *option = [[BMKTransitRoutePlanOption alloc]init];
                    //检索的起点，可通过关键字、坐标两种方式指定。cityName和cityID同时指定时，优先使用cityID
                    option.from = start_0;
                    //检索的终点，可通过关键字、坐标两种方式指定。cityName和cityID同时指定时，优先使用cityID
                    option.to = end_0;
                    //城市名，用于在哪个城市内进行检索
                    option.city = transitRoutePlanOption.city;
                    /*
                     公交检索策略，默认使用BMK_TRANSIT_TIME_FIRST
                     BMK_TRANSIT_TIME_FIRST：较快捷(公交)
                     BMK_TRANSIT_TRANSFER_FIRST：换乘(公交)
                     BMK_TRANSIT_WALK_FIRST：少步行(公交)
                     BMK_TRANSIT_NO_SUBWAY：不坐地铁
                     */
                    option.transitPolicy = transitRoutePlanOption.transitPolicy;
                    /**
                     室内公交路线检索，异步函数，返回结果在BMKRouteSearchDelegate的onGetTransitRouteResult中
                     */
                    BOOL flag = [_transitRouteSearch transitSearch:option];
                    if(flag) {
                        NSLog(@"市内公交路线检索成功");
                    } else {
                        NSLog(@"市内公交路线检索失败");
                    }
                }
            }
        }
        
    };
}
#pragma mark --------------------------delegate&datasoure---------------
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[YXYPresentationRightController alloc] initWithPresentedViewController:presented presentingViewController:source];
}
#pragma mark - BMKPoiSearchDelegate
/**
 *返回POI搜索结果
 *@param searcher 搜索对象
 *@param poiResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiResult:(BMKPoiSearch*)searcher result:(BMKPOISearchResult*)poiResult errorCode:(BMKSearchErrorCode)errorCode
{//方法不执行 请检查sdk的key值
    /**
     移除一组标注
     
     @param annotations 要移除的标注数组
     */
    [_mapView removeAnnotations:_mapView.annotations];
    //BMKSearchErrorCode错误码，BMK_SEARCH_NO_ERROR：检索结果正常返回
    if (errorCode == BMK_SEARCH_NO_ERROR) {
        NSMutableArray *annotations = [NSMutableArray array];
        for (NSUInteger i = 0; i < poiResult.poiInfoList.count; i ++) {
            //POI信息类的实例
            BMKPoiInfo *POIInfo = poiResult.poiInfoList[i];
            //初始化标注类BMKPointAnnotation的实例
            BMKPointAnnotation *annotaiton = [[BMKPointAnnotation alloc]init];
            //设置标注的经纬度坐标
            annotaiton.coordinate = POIInfo.pt;
            //设置标注的标题
            annotaiton.title = POIInfo.name;
            [annotations addObject:annotaiton];
        }
        //将一组标注添加到当前地图View中
        [_mapView addAnnotations:annotations];
        BMKPointAnnotation *annotation = annotations[0];
        //设置当前地图的中心点
        _mapView.centerCoordinate = annotation.coordinate;
    }
    //POI信息类的实例
    BMKPoiInfo *info = poiResult.poiInfoList[0];
    NSString *basicMessage = [NSString stringWithFormat:@"检索结果总数：%ld\n总页数：%ld\n当前页的结果数：%ld\n当前页的页数索引：%ld\n名称：%@\n纬度：%f\n经度：%f\n地址：%@\n电话：%@\nUID：%@\n省份：%@\n城市：%@\n行政区域：%@\n街景图ID：%@\n是否有详情信息：%d\n", poiResult.totalPOINum, poiResult.totalPageNum, poiResult.curPOINum, poiResult.curPageIndex, info.name, info.pt.latitude, info.pt.longitude, info.address, info.phone, info.UID, info.province, info.city, info.area, info.streetID, info.hasDetailInfo];
    NSString *detailMessage = @"";
    if (info.hasDetailInfo) {
        BMKPOIDetailInfo *detailInfo = info.detailInfo;
        detailMessage = [NSString stringWithFormat:@"距离中心点的距离：%ld\n类型：%@\n标签：%@\n导航引导点坐标纬度：%f\n导航引导点坐标经度：%f\n详情页URL：%@\n商户的价格：%f\n营业时间：%@\n总体评分：%f\n口味评分：%f\n服务评分：%f\n环境评分：%f\n星级评分：%f\n卫生评分：%f\n技术评分：%f\n图片数目：%ld\n团购数目：%ld\n优惠数目：%ld\n评论数目：%ld\n收藏数目：%ld\n签到数目：%ld", detailInfo.distance, detailInfo.type, detailInfo.tag, detailInfo.naviLocation.latitude, detailInfo.naviLocation.longitude, detailInfo.detailURL, detailInfo.price, detailInfo.openingHours, detailInfo.overallRating, detailInfo.tasteRating, detailInfo.serviceRating, detailInfo.environmentRating, detailInfo.facilityRating, detailInfo.hygieneRating, detailInfo.technologyRating, detailInfo.imageNumber, detailInfo.grouponNumber, detailInfo.discountNumber, detailInfo.commentNumber, detailInfo.favoriteNumber, detailInfo.checkInNumber];
    }
//    [self alertMessage:[NSString stringWithFormat:@"%@%@", basicMessage, detailMessage]];
}


/**
 *返回POI详情搜索结果
 *@param searcher 搜索对象
 *@param poiDetailResult 详情搜索结果
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiDetailResult:(BMKPoiSearch*)searcher result:(BMKPOIDetailSearchResult*)poiDetailResult errorCode:(BMKSearchErrorCode)errorCode
{
    
}

/**
 *返回POI室内搜索结果
 *@param searcher 搜索对象
 *@param poiIndoorResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiIndoorResult:(BMKPoiSearch*)searcher result:(BMKPOIIndoorSearchResult*)poiIndoorResult errorCode:(BMKSearchErrorCode)errorCode
{
    
}
/**
返回公交路线检索结果

@param searcher 检索对象
@param result 检索结果，类型为BMKTransitRouteResult
@param error 错误码，@see BMKSearchErrorCode
*/
- (void)onGetTransitRouteResult:(BMKRouteSearch *)searcher result:(BMKTransitRouteResult *)result errorCode:(BMKSearchErrorCode)error {
    [_mapView removeOverlays:_mapView.overlays];
    [_mapView removeAnnotations:_mapView.annotations];
    
    if (error == BMK_SEARCH_NO_ERROR) {
        //+polylineWithPoints: count:坐标点的个数
        __block NSUInteger pointCount = 0;
        //获取所有公交路线中第一条路线
        BMKTransitRouteLine *routeline = (BMKTransitRouteLine *)result.routes.firstObject;
        //遍历公交路线中的所有路段
        [routeline.steps enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //获取公交路线中的每条路段
            BMKTransitStep *step = routeline.steps[idx];
            //初始化标注类BMKPointAnnotation的实例
            BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc] init];
            //设置标注的经纬度坐标为子路段的入口经纬度
            annotation.coordinate = step.entrace.location;
            //设置标注的标题为子路段的说明
            annotation.title = step.instruction;
            /**
             
             当前地图添加标注，需要实现BMKMapViewDelegate的-mapView:viewForAnnotation:方法
             来生成标注对应的View
             @param annotation 要添加的标注
             */
            [_mapView addAnnotation:annotation];
            //统计路段所经过的地理坐标集合内点的个数
            pointCount += step.pointsCount;
        }];
        
//        //+polylineWithPoints: count:指定的直角坐标点数组
//        BMKMapPoint *points =  (BMKMapPoint *) BMKMapPoint.pointCount;
//        __block NSUInteger j = 0;
//        //遍历公交路线中的所有路段
//        [routeline.steps enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            //获取公交路线中的每条路段
//            BMKTransitStep *step = routeline.steps[idx];
//            for (NSUInteger i = 0; i < step.pointsCount; i ++) {
//                //将每条路段所经过的地理坐标点赋值给points
//                points[j].x = step.points[i].x;
//                points[j].y = step.points[i].y;
//                j ++;
//            }
//        }];
//        //根据指定直角坐标点生成一段折线
//        BMKPolyline *polyline = [BMKPolyline polylineWithPoints:points count:pointCount];
//        /**
//         向地图View添加Overlay，需要实现BMKMapViewDelegate的-mapView:viewForOverlay:方法
//         来生成标注对应的View
//         
//         @param overlay 要添加的overlay
//         */
//        [_mapView addOverlay:polyline];
//        //根据polyline设置地图范围
//        [self mapViewFitPolyline:polyline withMapView:self.mapView];
    }
}
//根据polyline设置地图范围
- (void)mapViewFitPolyline:(BMKPolyline *)polyline withMapView:(BMKMapView *)mapView {
    double leftTop_x, leftTop_y, rightBottom_x, rightBottom_y;
    if (polyline.pointCount < 1) {
        return;
    }
    BMKMapPoint pt = polyline.points[0];
    leftTop_x = pt.x;
    leftTop_y = pt.y;
    //左上方的点lefttop坐标（leftTop_x，leftTop_y）
    rightBottom_x = pt.x;
    rightBottom_y = pt.y;
    //右底部的点rightbottom坐标（rightBottom_x，rightBottom_y）
    for (int i = 1; i < polyline.pointCount; i++) {
        BMKMapPoint point = polyline.points[i];
        if (point.x < leftTop_x) {
            leftTop_x = point.x;
        }
        if (point.x > rightBottom_x) {
            rightBottom_x = point.x;
        }
        if (point.y < leftTop_y) {
            leftTop_y = point.y;
        }
        if (point.y > rightBottom_y) {
            rightBottom_y = point.y;
        }
    }
    BMKMapRect rect;
    rect.origin = BMKMapPointMake(leftTop_x , leftTop_y);
    rect.size = BMKMapSizeMake(rightBottom_x - leftTop_x, rightBottom_y - leftTop_y);
    UIEdgeInsets padding = UIEdgeInsetsMake(20, 10, 20, 10);
    [mapView fitVisibleMapRect:rect edgePadding:padding withAnimated:YES];
}
#pragma mark - BMKMapViewDelegate
/**
 根据anntation生成对应的annotationView
 
 @param mapView 地图View
 @param annotation 指定的标注
 @return 生成的标注View
 */
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        /**
         根据指定标识查找一个可被复用的标注，用此方法来代替新创建一个标注，返回可被复用的标注
         */
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewIdentifier];
        if (!annotationView) {
            /**
             初始化并返回一个annotationView
             
             @param annotation 关联的annotation对象
             @param reuseIdentifier 如果要重用view，传入一个字符串，否则设为nil，建议重用view
             @return 初始化成功则返回annotationView，否则返回nil
             */
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewIdentifier];
            if ([annotation.title isEqualToString:@"起点"] || [annotation.title isEqualToString:@"终点"]) {
                annotationView.image = [UIImage imageNamed:@"icon_start"];
            } else {
                NSBundle *bundle = [NSBundle bundleWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"mapapi.bundle"]];
                NSString *file = [[bundle resourcePath] stringByAppendingPathComponent:@"images/icon_nav_bus"];
                //annotationView显示的图片，默认是大头针
                annotationView.image = [UIImage imageWithContentsOfFile:file];
            }
        }
        return annotationView;
    }
    return nil;
}

/**
 根据overlay生成对应的BMKOverlayView
 
 @param mapView 地图View
 @param overlay 指定的overlay
 @return 生成的覆盖物View
 */
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay {
    if ([overlay isKindOfClass:[BMKPolyline class]]) {
        //初始化一个overlay并返回相应的BMKPolylineView的实例
        BMKPolylineView *polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay];
        //设置polylineView的填充色
        polylineView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:1];
        //设置polylineView的画笔（边框）颜色
        polylineView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        //设置polylineView的线宽度
        polylineView.lineWidth = 2.0;
        return polylineView;
    }
    return nil;
}

#pragma mark --------------------------懒加载-----------------------------
- (void)initMapView
{
    _mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    //    _mapView.backgroundColor = [UIColor whiteColor];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    //    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.left.right.offset(0);
    //        make.bottom.offset(-100);
    //    }];
    
    //显示定位图层
    //    _mapView.showsUserLocation = YES;
    //    [_mapView setZoomLevel:18];//将当前地图显示缩放等级设置为17级
    //    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
}


@end
