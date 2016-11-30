//
//  SwWaterfallFlowViewController.m
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/26.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import "SwWaterfallFlowViewController.h"
#import "SwRewriteCollectionViewLayout.h"
#import "RootTabbarController.h"

@interface SwWaterfallFlowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView* collectionView;
@property(nonatomic,strong)UICollectionViewLayout* layout;

@property(nonatomic,strong)NSArray* heightArr;

@end

@implementation SwWaterfallFlowViewController

static NSString * identifer = @"CollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"瀑布流";
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
}

#pragma mark collectionViewDelegate-collectionViewDatesource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell* cell = (CollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.heightArr.count;
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"index = %ld",(long)indexPath.row);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RootTabbarController * rootTabbar = [storyboard instantiateViewControllerWithIdentifier:@"RootTabbarController"];
    [self.navigationController pushViewController:rootTabbar animated:YES];
}

#pragma mark getter-setter
-(UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-44) collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:identifer];
    }
    return _collectionView;
}

-(UICollectionViewLayout *)layout{
    if(!_layout){
        _layout = [[SwRewriteCollectionViewLayout alloc]initWithItemsHeightBlock:^CGFloat(NSIndexPath *index) {
            return [self.heightArr[index.item] floatValue];
        }];
    }
    
    return _layout;
}

-(NSArray *)heightArr{
    if(!_heightArr){
        //随机生成高度
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i<100; i++) {
            [arr addObject:@(arc4random()%50+80)];
        }
        _heightArr = [arr copy];
    }
    return _heightArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

@interface CollectionViewCell()

@end
@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor=[self randomColor];
    }
    return self;
}
-(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
