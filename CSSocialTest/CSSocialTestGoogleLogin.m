//
//  CSSocialTestGoogleLogin.m
//  CSSocial
//
//  Created by Marko Hlebar on 3/3/13.
/*
 The MIT License (MIT)
 
 Copyright (c) 2013 Clover Studio. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "CSSocialTestGoogleLogin.h"

@implementation CSSocialTestGoogleLogin

-(void) performTest:(CSSocialResponseBlock)resultBlock
{
    
    if (![CSGoogle isAuthenticated])
    {
        [CSGoogle login:^
         {
             CSLog(@"Twitter login succeeded");
             resultBlock(nil,nil,nil);
         }
                   error:^(NSError *error)
         {
             CSLog(@"Twitter login failed : %@, %d", [error localizedDescription], [error code]);
             resultBlock(nil,nil,error);
             
         }];
    }
    else
    {
        [CSGoogle logout];
        resultBlock(nil,nil,nil);
    }
}

-(BOOL) passed
{
    return [CSGoogle isAuthenticated];
}

-(NSString*) name
{
    return @"Google Plus Login";
}


@end
