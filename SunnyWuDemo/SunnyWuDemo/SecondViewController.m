//
//  SecondViewController.m
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/24.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import "SecondViewController.h"
#import "SwCollectionViewCell.h"
#import "SwWaterfallFlowViewController.h"
#import "SwCollectionHeaderView.h"
#import "HBLIntegralMallCollectionReusableView.h"


#import <TestProjectFramework/ViewController.h>



@interface SecondViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Second";
    
    [ViewController PutLog];
    
    [self createTableView];
    
}

#pragma mark -初始化UICollectionView
-(void)createTableView{
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(180, 200);
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
    //注册Cell，必须要有
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    UINib *nib = [UINib nibWithNibName:@"SwCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"SwCollectionViewCell"];
    
    //这里的HeaderCRView 是自定义的header类型
//    [_muneView registerClass:[HeaderCRView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Identifier];
//    UINib *headerNib = [UINib nibWithNibName:@"SwCollectionHeaderView" bundle:[NSBundle mainBundle]];
//    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SwCollectionHeaderView"];
    
    UINib *headerNib = [UINib nibWithNibName:@"HBLIntegralMallCollectionReusableView" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HBLIntegralMallCollectionReusableView"];
    
    
    [self.view addSubview:self.collectionView];
}

#pragma mark ---分段代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
#pragma mark ---多少行代理
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }
    return 9;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    SwCollectionViewCell *swCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SwCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        swCollectionCell.SwImage.image = [UIImage imageNamed:@"image3"];
        NSString *row = [NSString stringWithFormat:@"这是漂亮妹子 + %ld",(long)indexPath.row];
        swCollectionCell.SwLab.text = row;
    }else{
        swCollectionCell.SwImage.image = [UIImage imageNamed:@"image4"];
        NSString *row = [NSString stringWithFormat:@"这是一个漂亮妹子 + %ld",(long)indexPath.row];
        swCollectionCell.SwLab.text = row;
    }
    
    return swCollectionCell;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 150);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}

//这个方法是返回 Header的大小 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(self.view.frame.size.width, 300);
    }else{
        return CGSizeMake(0, 0);
    }
}

//这个也是最重要的方法 获取Header的 方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
     UICollectionReusableView *reusableView =nil;

    if (kind ==UICollectionElementKindSectionHeader) {
    
    NSString *CellIdentifier = @"HBLIntegralMallCollectionReusableView";
    //从缓存中获取 header
     HBLIntegralMallCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        reusableView = header;
    }

    return reusableView;
}


#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"index = %ld",(long)indexPath.row);
    SwWaterfallFlowViewController *waterFallFlowVC =[[SwWaterfallFlowViewController alloc]init];
    [self.navigationController pushViewController:waterFallFlowVC animated:YES];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
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
