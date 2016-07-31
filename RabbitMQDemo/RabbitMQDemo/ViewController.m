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
@property (weak, nonatomic) IBOutlet UITextView *Text;
@property(nonatomic, strong)RMQConnection *conn;
@end


@implementation ViewController
- (void)delay:(void(^)())closure{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"clock");
        closure();
    });
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int a = 42;
    [self delay:^{
        NSLog(@"inside %d",a);
    }];
    a = 1337;
//    [self send];
//    [self registerReceive];
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
    [q publish:self.messageField.text];
    asl_add_log_file(NULL, STDERR_FILENO);
    asl_log(NULL,NULL,ASL_LEVEL_INFO,"Sent 'Hello World!'");
    
}

- (void)registerReceive{
    RMQConnection *conn = [[RMQConnection alloc] initWithUri:@"amqp://hxx:922033@101.200.219.144//ios" delegate:[RMQConnectionDelegateLogger new]];
    [conn start];
    
    id<RMQChannel> ch = [conn createChannel];
    
    RMQQueue *q = [ch queue:@"hello" options:RMQQueueDeclareDurable];
    asl_log(NULL,NULL,ASL_LEVEL_INFO,"Waiting for messages.");
    [q subscribe:^(RMQMessage * _Nonnull message) {
        NSLog(@"Received %@", message.content);
        _Text.text = [NSString stringWithFormat:@"%@\n%@",_Text.text,message.content];
    }];}
@end
