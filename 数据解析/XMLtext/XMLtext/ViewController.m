//
//  ViewController.m
//  XMLtext
//
//  Created by YZH on 2018/3/4.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onparser:(UIButton *)sender {
   // NSString* xmlstr=@"<info>kimy</info>";
    //NSString* xmlstr=@"<info name=\"kimy\"></info>";
    //NSString* xmlstr=@"<info><name>kimy</name></info>";
    NSString* xmlstr=@"<info><name>kimy</name><name>james</name></info>";
    NSData* smldata = [xmlstr dataUsingEncoding:NSUTF8StringEncoding];
    NSXMLParser* xml = [[NSXMLParser alloc] initWithData:smldata];
    xml.delegate=self;
    [xml parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    _text.text=[_text.text stringByAppendingString:@"准备解析"];
    _text.text=[_text.text stringByAppendingString:@"\n"];
}
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    _text.text=[_text.text stringByAppendingString:@"准备结束"];
    _text.text=[_text.text stringByAppendingString:@"\n"];
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
    _text.text=[_text.text stringByAppendingString:@"准备解析数据"];
    _text.text=[_text.text stringByAppendingString:@"\n"];
    _text.text=[_text.text stringByAppendingString:elementName];
    _text.text=[_text.text stringByAppendingString:@"\n"];
//    _text.text=[_text.text stringByAppendingString:[attributeDict objectForKey:@"name"]];
//    _text.text=[_text.text stringByAppendingString:@"\n"];
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    _text.text=[_text.text stringByAppendingString:@"准备往当前节点"];
    _text.text=[_text.text stringByAppendingString:@"\n"];
     _text.text=[_text.text stringByAppendingString:elementName];
      _text.text=[_text.text stringByAppendingString:@"\n"];
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    _text.text=[_text.text stringByAppendingString:string];
    _text.text=[_text.text stringByAppendingString:@"\n"];
}

@end
