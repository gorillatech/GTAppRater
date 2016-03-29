//
// GTAppRater.m
//
// Copyright (c) 2016 Gorilla Technologies Srl (http://gorillatech.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "GTAppRater.h"
#import "GTAppRaterViewController.h"

@interface GTAppRater()

@property (nonatomic, strong) GTAppRaterViewController *appRaterViewController;

@end

@implementation GTAppRater


- (void)promptForRating
{
    
    if (_appRaterViewController != nil && _appRaterViewController.isShowed){
        return;
    }
    _appRaterViewController = [[GTAppRaterViewController alloc] init];
    _appRaterViewController.headerLabelText = self.headerLabelText;
    _appRaterViewController.descriptionLabelText = self.descriptionLabelText;
    _appRaterViewController.rateButtonLabelText = self.rateButtonLabelText;
    _appRaterViewController.cancelButtonLabelText = self.cancelButtonLabelText;
    _appRaterViewController.setRaitingAlertTitle = self.setRaitingAlertTitle;
    _appRaterViewController.setRaitingAlertMessage = self.setRaitingAlertMessage;
    _appRaterViewController.appstoreRaitingAlertTitle = self.appstoreRaitingAlertTitle;
    _appRaterViewController.appstoreRaitingAlertMessage = self.appstoreRaitingAlertMessage;
    _appRaterViewController.appstoreRaitingCancel = self.appstoreRaitingCancel;
    _appRaterViewController.appstoreRaitingButton = self.appstoreRaitingButton;
    _appRaterViewController.disadvantagesAlertTitle = self.disadvantagesAlertTitle;
    _appRaterViewController.disadvantagesAlertMessage = self.disadvantagesAlertMessage;
    _appRaterViewController.email = self.email;
    _appRaterViewController.emailSubject = self.emailSubject;
    _appRaterViewController.emailText = self.emailText;
    _appRaterViewController.emailErrorAlertText = self.emailErrorAlertText;
    _appRaterViewController.okText = self.okText;
    _appRaterViewController.minAppStoreRaiting = self.minAppStoreRaiting;
    
    [_appRaterViewController.view setFrame:[[UIScreen mainScreen] bounds]];
    
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:_appRaterViewController.view];
    
    //inform about prompt
    if ([self.delegate respondsToSelector:@selector(iRateDidPromptForRating)]) {
        [self.delegate iRateDidPromptForRating];
    }
    
}

+ (id)sharedInstance
{
    static GTAppRater *sharedInstance = nil;
    if (sharedInstance == nil)
    {
        sharedInstance = [[GTAppRater alloc] init];
    }
    return sharedInstance;
}


-(NSString *)headerLabelText{
    if (_headerLabelText == nil){
        _headerLabelText = [NSString stringWithFormat:NSLocalizedString(@"Like %@?", @""), self.applicationName];
    }
    return _headerLabelText;
}


-(NSString *)descriptionLabelText{
    if (_descriptionLabelText == nil){
        _descriptionLabelText = NSLocalizedString(@"Touch the star to rate.", @"");
    }
    return _descriptionLabelText;
}


-(NSString *)rateButtonLabelText{
    if (_rateButtonLabelText == nil){
        _rateButtonLabelText = NSLocalizedString(@"Rate", @"");
    }
    return _rateButtonLabelText;
}


-(NSString *)cancelButtonLabelText{
    if (_cancelButtonLabelText == nil){
        _cancelButtonLabelText = NSLocalizedString(@"Not Now", @"");
    }
    return _cancelButtonLabelText;
}


-(NSString *)setRaitingAlertTitle{
    if (_setRaitingAlertTitle == nil){
        _setRaitingAlertTitle = NSLocalizedString(@"Rate", @"");
    }
    return _setRaitingAlertTitle;
}


-(NSString *)setRaitingAlertMessage{
    if (_setRaitingAlertMessage == nil){
        _setRaitingAlertMessage = NSLocalizedString(@"Touch the star to rate.", @"");
    }
    return _setRaitingAlertMessage;
}


-(NSString *)appstoreRaitingAlertTitle{
    if (_appstoreRaitingAlertTitle == nil){
        _appstoreRaitingAlertTitle = NSLocalizedString(@"Write a review on the AppStore", @"");
    }
    return _appstoreRaitingAlertTitle;
}


-(NSString *)appstoreRaitingAlertMessage{
    if (_appstoreRaitingAlertMessage == nil){
        _appstoreRaitingAlertMessage = NSLocalizedString(@"Would you mind taking a moment to rate it on the AppStore? It won’t take more than a minute. Thanks for your support!", @"");
    }
    return _appstoreRaitingAlertMessage;
}


-(NSString *)appstoreRaitingCancel{
    if (_appstoreRaitingCancel == nil){
        _appstoreRaitingCancel = NSLocalizedString(@"Cancel", @"");
    }
    return _appstoreRaitingCancel;
}


-(NSString *)appstoreRaitingButton{
    if (_appstoreRaitingButton == nil){
        _appstoreRaitingButton = NSLocalizedString(@"Rate It Now", @"");
    }
    return _appstoreRaitingButton;
}


-(NSString *)disadvantagesAlertTitle{
    if (_disadvantagesAlertTitle == nil){
        _disadvantagesAlertTitle = NSLocalizedString(@"Disadvantages", @"");
    }
    return _disadvantagesAlertTitle;
}


-(NSString *)disadvantagesAlertMessage{
    if (_disadvantagesAlertMessage == nil){
        _disadvantagesAlertMessage = NSLocalizedString(@"Please specify the deficiencies in the application. We will try to fix it!", @"");
    }
    return _disadvantagesAlertMessage;
}


-(NSString *)email{
    if (_email == nil){
        _email = @"";
    }
    return _email;
}


-(NSString *)emailSubject{
    if (_emailSubject == nil){
        _emailSubject = self.applicationName;
    }
    return _emailSubject;
}


-(NSString *)emailText{
    if (_emailText == nil){
        _emailText = @"";
    }
    return _emailText;
}


-(NSString *)emailErrorAlertTitle{
    if (_emailErrorAlertTitle == nil){
        _emailErrorAlertTitle = NSLocalizedString(@"Error", @"");
    }
    return _emailErrorAlertTitle;
}


-(NSString *)emailErrorAlertText{
    if (_emailErrorAlertText == nil){
        _emailErrorAlertText = NSLocalizedString(@"Sending error", @"");
    }
    return _emailErrorAlertText;
}


-(NSString *)okText{
    if (_okText == nil){
        _okText = NSLocalizedString(@"OK", @"");
    }
    return _okText;
}


-(int)minAppStoreRaiting{
    if (_minAppStoreRaiting == 0){
        _minAppStoreRaiting = 5;
    }
    return _minAppStoreRaiting;
}



@end
