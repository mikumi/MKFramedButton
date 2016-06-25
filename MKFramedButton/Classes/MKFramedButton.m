#import "MKFramedButton.h"
#import "UIColor+Chameleon.h"

//============================================================
//== Private Interface
//============================================================
@interface MKFramedButton ()

@property (nonatomic, strong, nullable) UIColor *originalBorderColor;
@property (nonatomic, strong, nullable) UIColor *disabledBorderColor;

@end

//============================================================
//== Implementation
//============================================================
@implementation MKFramedButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUi];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUi];
    }
    return self;
}

- (void)setupUi
{
    self.clipsToBounds = YES;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor colorWithHexString:@"#ffffff"].CGColor;
    self.disabledBorderColor = [UIColor lightGrayColor];
    [self setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    [self setTitleColor:self.disabledBorderColor forState:UIControlStateDisabled];

    [self addTarget:self action:@selector(highlightDidStart) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(highlightDidStart) forControlEvents:UIControlEventTouchDragEnter];

    [self addTarget:self action:@selector(highlightDidEnd) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(highlightDidEnd) forControlEvents:UIControlEventTouchUpOutside];
    [self addTarget:self action:@selector(highlightDidEnd) forControlEvents:UIControlEventTouchCancel];
    [self addTarget:self action:@selector(highlightDidEnd) forControlEvents:UIControlEventTouchDragExit];
}

#pragma mark - UIButton

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [super setTitleColor:color forState:state];

    if (state == UIControlStateNormal) {
        UIColor *const buttonColor = [self titleColorForState:UIControlStateNormal];
        UIColor *const buttonHighlightColor = [buttonColor darkenByPercentage:0.5f];
        [self setTitleColor:buttonHighlightColor forState:UIControlStateHighlighted];
    } else if (state == UIControlStateDisabled) {
        self.disabledBorderColor = color;
    }
}

- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state {
    [super setAttributedTitle:title forState:state];

    if (state == UIControlStateNormal) {
        NSRange range = NSMakeRange(0, 1);
        UIColor *const buttonColor = [title attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
        if (buttonColor) {
            UIColor *const buttonHighlightColor = [buttonColor darkenByPercentage:0.5f];
            NSMutableAttributedString *const highlightTitle = [title mutableCopy];
            [highlightTitle removeAttribute:NSForegroundColorAttributeName range:range];
            [highlightTitle addAttribute:NSForegroundColorAttributeName value:buttonHighlightColor range:range];
            [self setAttributedTitle:highlightTitle forState:UIControlStateHighlighted];

            UIColor *const buttonDisabledColor = [UIColor lightGrayColor];
            NSMutableAttributedString *const disabledTitle = [title mutableCopy];
            [disabledTitle removeAttribute:NSForegroundColorAttributeName range:range];
            [disabledTitle addAttribute:NSForegroundColorAttributeName value:buttonDisabledColor range:range];
            [self setAttributedTitle:disabledTitle forState:UIControlStateDisabled];
        }
    } else if (state == UIControlStateDisabled) {
        NSRange range = NSMakeRange(0, 1);
        UIColor *const buttonColor = [title attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:&range];
        if (buttonColor) {
            self.disabledBorderColor = buttonColor;
        }
    }
}

- (void)setEnabled:(BOOL)enabled {
    if (self.enabled) {
        self.originalBorderColor = [UIColor colorWithCGColor:self.layer.borderColor];
    }
    if (enabled) {
        self.layer.borderColor = self.originalBorderColor.CGColor;
    } else {
        self.layer.borderColor = self.disabledBorderColor.CGColor;
    }
    [super setEnabled:enabled];
}

#pragma mark - Private Implementation

- (void)highlightDidStart
{
    self.originalBorderColor = [UIColor colorWithCGColor:self.layer.borderColor];
    self.layer.borderColor = [self.originalBorderColor darkenByPercentage:0.5f].CGColor;
}

- (void)highlightDidEnd
{
    self.layer.borderColor = self.originalBorderColor.CGColor;
}

@end

