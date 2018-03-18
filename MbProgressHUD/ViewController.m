//
//  ViewController.m
//  MbProgressHUD
//
//  Created by 曹轩 on 2018/3/18.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import "ViewController.h"
#import "Toast+UIView.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSInteger i=0; i<4; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(100, 50+i*110, 300, 100);
        btn.tag=100+i;
        btn.backgroundColor=[UIColor greenColor];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
       // btn.center.x=self.view.center.x;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (i==0) {
            [btn setTitle:@"底部显示" forState:UIControlStateNormal];
        }
        else if (i==1){
            [btn setTitle:@"中间显示" forState:UIControlStateNormal];
        }
        else if (i==2)
        {
            [btn setTitle:@"中间显示黑色正方形框" forState:UIControlStateNormal];

        }
        //
        else{
            [btn setTitle:@"自定义view" forState:UIControlStateNormal];

        }
        

    }
}

-(void)btnClick:(UIButton*)btn{
    
    if (btn.tag==100) {
        // 在地下显示
        [self.view makeToast:@"姓名不能为空" duration:1 position:@"bottom"];
       // [self.view makeToast:@"姓名不能为nil" duration:1 position:@"bottom" title:@"提示"];

    }
    else if (btn.tag==101)
    {
        // 在中间显示
         [self.view makeToast:@"姓名不能为空" duration:1 position:@"center"];

    }
    else if (btn.tag==102){
        [self.view makeToastActivity];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.view hideToastActivity];
        });

    }
    
    else{
        
        // 自定义 过一段时间时间自己消失 也可以自己设置时间
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-100, 100, 100)];
        view.backgroundColor=[UIColor greenColor];
        [self.view showToast:view];
        
    
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
