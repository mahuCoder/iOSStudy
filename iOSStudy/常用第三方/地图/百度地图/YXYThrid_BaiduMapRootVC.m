//
//  YXYThrid_BaiduMapRootVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/5/20.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_BaiduMapRootVC.h"
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件
#import "YXYAlertViewController.h"

#import <BaiduMapAPI_Map/BMKPointAnnotation.h>//大头针文件
#import "CustomPaopaoView.h"//泡泡
#import "BMKAnimationAnnotationView.h"//动画点
#import "BMKClusterManager.h"//多点聚合
#import <BaiduMapAPI_Map/BMKPinAnnotationView.h>//




//复用annotationView的指定唯一标识
static NSString *annotationViewIdentifier = @"com.Baidu.BMKClusterAnnotation";

#pragma mark - ClusterAnnotation
@interface ClusterAnnotation : BMKPointAnnotation
@property (nonatomic, assign) NSInteger size;
@end

@implementation ClusterAnnotation

@end


//#import <Masonry/Masonry.h>
@interface YXYThrid_BaiduMapRootVC ()<BMKMapViewDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) NSMutableArray *type_array;

@property (nonatomic, strong) BMKPointAnnotation *baseAnnotation;   //基础大头针
@property (nonatomic, strong) BMKPointAnnotation *baseMoveAnnotation;//自定义大头针

@property (nonatomic, strong) BMKPointAnnotation *diyAnnotation;//diy大头针
@property (nonatomic, assign) BOOL isDiyAnnotation;

@property (nonatomic, strong) BMKPointAnnotation *diyPopoAnnotation;//diypopo大头针
@property (nonatomic, assign) BOOL isDiyPopoAnnotation;

@property (nonatomic, strong) BMKPointAnnotation *animationAnnotation;//动画大头针
@property (nonatomic, assign) BOOL isAnimationAnnotation;

@property (nonatomic, strong) ClusterAnnotation *multAnnotaionView;//多点
@property (nonatomic, assign) BOOL isMultAnnotation;
@property (nonatomic, assign) NSUInteger clusterZoom;//
@property (nonatomic, strong) BMKClusterManager *clusterManager;//点聚合数据源



@end

@implementation YXYThrid_BaiduMapRootVC

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
    
    UIBarButtonItem *load_item = [[UIBarButtonItem alloc] initWithTitle:@"路线" style:(UIBarButtonItemStyleDone) target:self action:@selector(actionMoreLoad)];
    UIBarButtonItem *map_item = [[UIBarButtonItem alloc] initWithTitle:@"类型" style:(UIBarButtonItemStyleDone) target:self action:@selector(actionMoreType)];
    self.navigationItem.rightBarButtonItems = @[load_item, map_item];
    [self initMapView];
}
#pragma mark --------------------------网络处理--------------------------


#pragma mark --------------------------点击事件--------------------------
- (void)actionMoreLoad
{
    UIViewController *vc = [[NSClassFromString(@"YXYThrid_BaiduMapLoadingVC") alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)actionMoreType
{
    if (!_type_array) {
        _type_array = @[@{@"title":@"卫星地图"}.mutableCopy,
                        @{@"title":@"空白地图"}.mutableCopy,
                        @{@"title":@"所有手势",@"isSel":@YES}.mutableCopy,
                        @{@"title":@"缩放开启",@"isSel":@YES}.mutableCopy,
                        @{@"title":@"平移开启",@"isSel":@YES}.mutableCopy,
                        @{@"title":@"旋转开启",@"isSel":@YES}.mutableCopy,
                        @{@"title":@"俯视开启",@"isSel":@YES}.mutableCopy,
                        @{@"title":@"改变中心点"}.mutableCopy,
                        @{@"title":@"固定标注绘制"}.mutableCopy,
                        @{@"title":@"移动标注绘制"}.mutableCopy,
                        @{@"title":@"自定义标注绘制"}.mutableCopy,
                        @{@"title":@"自定义泡泡"}.mutableCopy,
                        @{@"title":@"动画标注绘制"}.mutableCopy,
                        @{@"title":@"点聚合"}.mutableCopy,
                        ].mutableCopy;
    }
    YXYAlertViewController *vc = [[YXYAlertViewController alloc] init];
    vc.arrayData = _type_array;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
//    @weakify(self);
    vc.block = ^{
//        @strongify(self);
        for (NSMutableDictionary *dictM in self.type_array) {
            NSString *title = dictM[@"title"];
            BOOL isSel = [dictM[@"isSel"] boolValue];
            if ([title isEqualToString:@"卫星地图"]) {
                self.mapView.mapType = isSel ? BMKMapTypeSatellite : BMKMapTypeStandard;
            } else if ([title isEqualToString:@"空白地图"]) {
                self.mapView.mapType = isSel ? BMKMapTypeNone : ( [[self.type_array[0] objectForKey:@"isSel"] boolValue] ? BMKMapTypeSatellite : BMKMapTypeStandard);
            } else if ([title isEqualToString:@"所有手势"]) {
                self.mapView.gesturesEnabled = isSel ? YES : NO;
            } else if ([title isEqualToString:@"缩放开启"]) {
                //禁止双指拉伸缩放地图
                self.mapView.zoomEnabled = isSel ? YES : NO;
                //禁止单指双击缩放地图
                self.mapView.zoomEnabledWithTap= isSel ? YES : NO;
                /* 禁用缩放手势后，可以通过代码设置地图地图比例尺级别来实现地图的缩放，示例代码如下：
                 [_mapView setZoomLevel:17];*/
                /*百度地图SDK支持21级的地图显示，卫星图、热力图只支持显示到20级，放大至21级时将不再显示；交通路况图只支持显示到21级，放大至22级时将不再显示。各地
                 地图类型或图层类型 显示层级 2D地图    4-21级  3D地图    19-21级  卫星图    4-20级  路况交通图    7-21级  百度城市热力图    11-20级
                 室内图    17-22级 */
            } else if ([title isEqualToString:@"平移开启"]) {
                self.mapView.scrollEnabled = isSel ? YES : NO;
                /*禁用平移手势后，可以通过代码设置地图中心点经纬度来实现地图的平移，示例代码如下：
                 [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.924257, 116.403263)];*/
            } else if ([title isEqualToString:@"旋转开启"]) {
                self.mapView.rotateEnabled= isSel ? YES : NO;
                /* 禁用旋转手势后，可以通过代码设置地图地图旋转角来实现地图的旋转，示例代码如下：
                 //rotation值的范围为－180～180度
                 [_mapView setRotation:90];*/
            } else if ([title isEqualToString:@"改变中心点"]) {
                if (isSel) {
                    //设置中心点经纬度坐标
                    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(35.718, 111.581);
                    /**
                     设定地图中心点坐标
                     @param coordinate 要设定的地图中心点坐标，用经纬度表示
                     @param animated 是否采用动画效果
                     */
                    [self.mapView setCenterCoordinate:center animated:YES];
                } else {
                    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(39.915526, 116.403847);
                    [self.mapView setCenterCoordinate:center animated:YES];
                }
            } else if ([title isEqualToString:@"固定标注绘制"]) {
                if (isSel) {
                    if (!self.baseAnnotation) {
                        self.baseAnnotation = [[BMKPointAnnotation alloc]init];
                    }
                    self.baseAnnotation.coordinate = CLLocationCoordinate2DMake(39.915, 116.404);
                    //设置标注的标题
                    self.baseAnnotation.title = @"北京";
                    //副标题
                    self.baseAnnotation.subtitle = @"天安门";
                    [self.mapView addAnnotation:self.baseAnnotation];
                } else {
                    //移除大头针
                    [self.mapView removeAnnotation:self.baseAnnotation];
                }
                
            } else if ([title isEqualToString:@"移动标注绘制"]) {
                if (isSel) {
                    if (!self.baseMoveAnnotation) {
                        self.baseMoveAnnotation = [[BMKPointAnnotation alloc]init];
                    }
//                    self.baseMoveAnnotation.coordinate = CLLocationCoordinate2DMake(39.915, 116.404);
                     //标注是否固定在指定屏幕位置,  必须与screenPointToLock一起使用
                    self.baseMoveAnnotation.isLockedToScreen = YES;
                    /**
                     标注锁定在屏幕上的位置(地图初始化后才能设置，可以在地图加载完成的回调方法
                     -mapViewDidFinishLoading中使用此属性
                     */
                    self.baseMoveAnnotation.screenPointToLock = self.view.center;
                    //设置标注的标题
                    self.baseMoveAnnotation.title = @"标注";
                    //副标题
                    self.baseMoveAnnotation.subtitle = @"大头针不随地图移动";
                    [self.mapView addAnnotation:self.baseMoveAnnotation];
                } else {
                    //移除大头针
                    [self.mapView removeAnnotation:self.baseMoveAnnotation];
                }
            } else if ([title isEqualToString:@"自定义标注绘制"]) {//
                self.isDiyAnnotation = isSel;
                if (isSel) {
                    if (!self.diyAnnotation) {
                        self.diyAnnotation = [[BMKPointAnnotation alloc]init];
                    }
                    self.diyAnnotation.coordinate = CLLocationCoordinate2DMake(39.915, 116.404);
                    //设置标注的标题
                    self.diyAnnotation.title = @"标注";
                    //副标题
                    self.diyAnnotation.subtitle = @"自定义大头针";
                    [self.mapView addAnnotation:self.diyAnnotation];
                } else {
                    //移除大头针
                    [self.mapView removeAnnotation:self.diyAnnotation];
                }
            } else if ([title isEqualToString:@"自定义泡泡"]) {//
                self.isDiyPopoAnnotation = isSel;
                if (isSel) {
                    if (!self.diyPopoAnnotation) {
                        self.diyPopoAnnotation = [[BMKPointAnnotation alloc]init];
                    }
                    self.diyPopoAnnotation.coordinate = CLLocationCoordinate2DMake(39.915, 116.404);
                    //设置标注的标题
                    self.diyPopoAnnotation.title = @"标注";
                    //副标题
                    self.diyPopoAnnotation.subtitle = @"自定义泡泡";
                    [self.mapView addAnnotation:self.diyPopoAnnotation];
                } else {
                    //移除大头针
                    [self.mapView removeAnnotation:self.diyPopoAnnotation];
                }
            } else if ([title isEqualToString:@"动画标注绘制"]) {//
                self.isAnimationAnnotation = isSel;
                if (isSel) {
                    if (!self.animationAnnotation) {
                        self.animationAnnotation = [[BMKPointAnnotation alloc]init];
                    }
                    self.animationAnnotation.coordinate = CLLocationCoordinate2DMake(39.915, 116.404);
                    //设置标注的标题
                    self.animationAnnotation.title = @"标注";
                    //副标题
                    self.animationAnnotation.subtitle = @"动画";
                    [self.mapView addAnnotation:self.animationAnnotation];
                } else {
                    //移除大头针
                    [self.mapView removeAnnotation:self.animationAnnotation];
                }
            } else if ([title isEqualToString:@"点聚合"]) {//
                self.isMultAnnotation = isSel;
                if (isSel) {
                      self.clusterManager = [[BMKClusterManager alloc] init];
                    [self.mapView setZoomLevel:15];
                    [self updateClusters];
                } else {
                    [self.mapView removeAnnotations:_mapView.annotations];
                }
            }
        }
    };
}

/**
    可自定义大头针和样式
 */
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation
{
    if (self.diyAnnotation) {//自定义
        if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
            static NSString *reuseIndetifier = @"annotationReuseIndetifier";
            BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
            if (annotationView == nil)
            {
                annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
            }
            annotationView.image = [UIImage imageNamed:@"attention"];
            return annotationView;
        }
    }
    if (self.diyPopoAnnotation) {
        if ([annotation isKindOfClass:[BMKPointAnnotation class]])
        {
            static NSString *reuseIndetifier_popo = @"annotationReuseIndetifier_popo";
            BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier_popo];
            if (annotationView == nil)
            {
                annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier_popo];
            }
            annotationView.image = [UIImage imageNamed:@"attention"];
            annotationView.canShowCallout = YES;
            CustomPaopaoView *customPopView = [[CustomPaopaoView alloc] init];
            customPopView.frame = CGRectMake(0, 0, 120.0f, 70.0f);
            customPopView.image = [UIImage imageNamed:@"attention"];
            customPopView.title = @"北京";
            customPopView.subtitle = @"天安门";
            BMKActionPaopaoView *pView = [[BMKActionPaopaoView alloc] initWithCustomView:customPopView];
            pView.backgroundColor = [UIColor lightGrayColor];
            pView.frame = customPopView.frame;
            annotationView.paopaoView = pView;
            return annotationView;
        }
    }
    if (self.isAnimationAnnotation) {
        /**
         根据指定标识查找一个可被复用的标注，用此方法来代替新创建一个标注，返回可被复用的标注
         */
        static NSString *reuseIndetifier_animation = @"annotationReuseIndetifier_animation";
        BMKAnimationAnnotationView *annotationView = (BMKAnimationAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier_animation];
        if (!annotationView) {
            /**
             初始化并返回一个annotationView
             
             @param annotation 关联的annotation对象
             @param reuseIdentifier 如果要重用view，传入一个字符串，否则设为nil，建议重用view
             @return 初始化成功则返回annotationView，否则返回nil
             */
            annotationView = [[BMKAnimationAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier_animation];
            //自定义标注的图片，默认图片是大头针
            return annotationView;
        }
    }
    if (self.isMultAnnotation) {
        ClusterAnnotation *cluster = (ClusterAnnotation*)annotation;
          static NSString *mult_animationIdentifier = @"mult_animationIdentifier";
        BMKPinAnnotationView *annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:mult_animationIdentifier];
        UILabel *annotationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
        annotationLabel.textColor = [UIColor whiteColor];
        annotationLabel.font = [UIFont systemFontOfSize:11];
        annotationLabel.textAlignment = NSTextAlignmentCenter;
        annotationLabel.hidden = NO;
        annotationLabel.text = [NSString stringWithFormat:@"%ld", cluster.size];
        annotationLabel.backgroundColor = [UIColor greenColor];
        annotationView.alpha = 0.8;
        [annotationView addSubview:annotationLabel];
        if (cluster.size == 1) {
            annotationLabel.hidden = YES;
            annotationView.pinColor = BMKPinAnnotationColorRed;
        }
        if (cluster.size > 20) {
            annotationLabel.backgroundColor = [UIColor redColor];
        } else if (cluster.size > 10) {
            annotationLabel.backgroundColor = [UIColor purpleColor];
        } else if (cluster.size > 5) {
            annotationLabel.backgroundColor = [UIColor blueColor];
        } else {
            annotationLabel.backgroundColor = [UIColor greenColor];
        }
        [annotationView setBounds:CGRectMake(0, 0, 22, 22)];
        annotationView.draggable = YES;
        annotationView.annotation = annotation;
        return annotationView;
    }
    return nil;
}




#pragma mark --------------------------delegate&datasoure---------------
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[YXYPresentationRightController alloc] initWithPresentedViewController:presented presentingViewController:source];
}
/**
 地图加载完成时会调用此方法
 
 @param mapView 当前地图View
 */
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
    if (self.isMultAnnotation) {
        [self updateClusters];
    }
}
/**
 地图渲染每一帧画面过程中，以及每次需要重新绘制地图时(例如添加覆盖物)都会调用此方法
 @param mapView 地图View
 @param status 地图状态
 */
- (void)mapView:(BMKMapView *)mapView onDrawMapFrame:(BMKMapStatus *)status {
    if (self.isMultAnnotation) {
        if (_clusterZoom != 0 && _clusterZoom != (NSInteger)mapView.zoomLevel) {
            [self updateClusters];
        }
    }
   
}
- (void)updateClusters {
    if (self.isMultAnnotation) {
        _clusterZoom = (NSInteger)_mapView.zoomLevel;
        @synchronized(_clusterManager.clusterCaches) {
            NSMutableArray *clusters = [_clusterManager.clusterCaches objectAtIndex:(_clusterZoom - 3)];
            if (clusters.count > 0) {
                /**
                 移除一组标注
                 
                 @param annotations 要移除的标注数组
                 */
                [_mapView removeAnnotations:_mapView.annotations];
                //将一组标注添加到当前地图View中
                [_mapView addAnnotations:clusters];
            } else {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    ///获取聚合后的标注
                    __block NSArray *array = [_clusterManager getClusters:_clusterZoom];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        for (BMKCluster *item in array) {
                            ClusterAnnotation *annotation = [[ClusterAnnotation alloc] init];
                            //设置标注的经纬度坐标
                            annotation.coordinate = item.coordinate;
                            annotation.size = item.size;
                            //设置标注的标题
                            annotation.title = [NSString stringWithFormat:@"我是%ld个", item.size];
                            [clusters addObject:annotation];
                        }
                        /**
                         移除一组标注
                         
                         @param annotations 要移除的标注数组
                         */
                        [self->_mapView removeAnnotations:self->_mapView.annotations];
                        //将一组标注添加到当前地图View中
                        [self->_mapView addAnnotations:clusters];
                    });
                });
            }
        }
    }

}
#pragma mark --------------------------初始化UI---------------------------

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
