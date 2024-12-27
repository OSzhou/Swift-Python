//
//  MyOCWrapper.m
//  Swift-Python
//
//  Created by Zh on 2024/12/27.
//

#import "MyOCWrapper.h"
#import "Swift_Python-Swift.h"

@implementation MyOCWrapper

- (NSString *)greet:(NSString *)name {
    NSLog(@"Python call Objective-C, succeed! Py: Hello OC!");
    MySwiftClass *swiftClass = [[MySwiftClass alloc] init];
    NSString *result = [swiftClass greetWithName: name];
    return result;
}


@end
