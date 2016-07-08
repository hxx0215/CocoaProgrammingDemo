//
//  ViewController.m
//  RabbitMQDemo
//
//  Created by ShadowFox on 6/17/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

#import "ViewController.h"
#import <RMQClient/RMQClient.h>
#include <asl.h>

//@import RMQClient;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *messageField;
@property(nonatomic, strong)id<RMQChannel> ch;
@property(nonatomic, strong)RMQConnection *conn;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self send];
    [self registerReceive];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)send{
    self.conn = [[RMQConnection alloc] initWithUri:@"url" delegate:[RMQConnectionDelegateLogger new]];
    [self.conn start];
    
    self.ch = [self.conn createChannel];
}
- (IBAction)sendMessage:(id)sender {
    
    RMQQueue *q = [self.ch queue:@"hello" options:RMQQueueDeclareDurable];
    [q publish:@"hello world"];
    asl_add_log_file(NULL, STDERR_FILENO);
    asl_log(NULL,NULL,ASL_LEVEL_INFO,"Sent 'Hello World!'");
    
}

- (void)registerReceive{
    RMQConnection *conn = [[RMQConnection alloc] initWithUri:@"url" delegate:[RMQConnectionDelegateLogger new]];
    [conn start];
    
    id<RMQChannel> ch = [conn createChannel];
    
    RMQQueue *q = [ch queue:@"hello" options:RMQQueueDeclareDurable];
    asl_log(NULL,NULL,ASL_LEVEL_INFO,"Waiting for messages.");
    [q subscribe:^(RMQMessage * _Nonnull message) {
        NSLog(@"Received %@", message.content);
    }];}
@end
