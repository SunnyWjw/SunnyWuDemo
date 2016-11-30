//
//  SWTableViewController.m
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/24.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import "SWTableViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

#import "SWDBDataBaseModel.h"


#define ID        @"id"
#define NUMBER      @"number"
#define PROVINCE      @"province"
#define CITY   @"city"
#define TELECOM   @"telecom"
#define TABLENAME @"numberaddress"

@interface SWTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    FMDatabase *db;
    NSString *database_path;
    
}
@property(nonatomic,strong) UITableView *tableview;
@property(nonatomic,strong) NSString *filePath;
@property(nonatomic,strong) NSString *numberPhone;

@end

@implementation SWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self CreateTableView];
    
    //    通过指定的路径读取文本内容
    _filePath = [[NSBundle mainBundle]pathForResource:@"numberaddress" ofType:@"db"];
    NSLog(@"文件路径str == %@",_filePath);
    self.numberPhone = @"1310093";

    [self selectData];
}

-(void)selectData{
    db = [FMDatabase databaseWithPath:_filePath];
    if ([db open]) {
        NSString * sql = [NSString stringWithFormat:
                          @"SELECT * FROM %@ WHERE number like '%%%@%%'",TABLENAME,self.numberPhone];
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
            int Id = [rs intForColumn:ID];
            NSString * number = [rs stringForColumn:NUMBER];
            NSString * province = [rs stringForColumn:PROVINCE];
            NSString * city = [rs stringForColumn:CITY];
            NSString * telecom = [rs stringForColumn:TELECOM];
            NSLog(@"id = %d, number = %@, province = %@  city = %@   telecom = %@", Id, number, province,city, telecom);
        }
        [db close];
    }
}

-(void)selectNewData{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [arr addObjectsFromArray:[SWDBDataBaseModel findByCriteria:@" WHERE number like '%1305559%'"]];
        NSLog(@"Arr == %@",arr);
//        NSLog(@"小于20岁:%@",[SWDBDataBaseModel findByCriteria:@" WHERE number like '%%%@%%'",TABLENAME,@"1305559]);
    });
//    if ([db open]) {
//        NSString * sql = [NSString stringWithFormat:
//                          @"SELECT * FROM %@ WHERE number like '%%%@%%'",TABLENAME,@"1305559"];
//        FMResultSet * rs = [db executeQuery:sql];
//        while ([rs next]) {
//            int Id = [rs intForColumn:ID];
//            NSString * number = [rs stringForColumn:NUMBER];
//            NSString * province = [rs stringForColumn:PROVINCE];
//            NSString * city = [rs stringForColumn:CITY];
//            NSString * telecom = [rs stringForColumn:TELECOM];
//            NSLog(@"id = %d, number = %@, province = %@  city = %@   telecom = %@", Id, number, province,city, telecom);
//        }
//        [db close];
//    }
}


-(void)CreateTableView{
    self.tableview =[[UITableView alloc]init];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
        make.top.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0);
        
    }];
    
    self.tableview.tableHeaderView = [self CreateHeaderView];
}

-(UIView *)CreateHeaderView{
    UIView *headerView =[[UIView alloc]init];
    headerView.backgroundColor =[UIColor purpleColor];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tableview).with.offset(0);
        make.top.equalTo(self.tableview).with.offset(0);
        make.right.equalTo(self.tableview).with.offset(0);
        make.height.mas_equalTo(@200);
    }];
    
    return headerView;
}
/*

#pragma mark -允许数据源告知必须加载到Table View中的表的Section数。
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark -设置表格的行数为数组的元素个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 1;
            break;
            
        default:
            return callLogArrayDetail.count;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

}

*/




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
