//
//  main.m
//  PolyglotObjC
//
//  Created by Charles Dawson on 8/27/14.
//  Copyright (c) 2014 Dawson. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString * sampleString = @"The quick brown fox jumped over the white fence";
        
        // Ignore whitespace & punctuation, join names
        NSLinguisticTaggerOptions options = NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation | NSLinguisticTaggerJoinNames;
        
        NSLinguisticTagger * tagger = [[NSLinguisticTagger alloc] initWithTagSchemes: [NSLinguisticTagger availableTagSchemesForLanguage:@"en"] options: options];
        tagger.string = sampleString;
        
        NSRange targetRange = NSMakeRange(0, [sampleString length]);
        
        // Build a new string without adjectives
        NSMutableString * stringWithoutAdjectives = [NSMutableString stringWithString:@""];
        [tagger enumerateTagsInRange: targetRange scheme: NSLinguisticTagSchemeNameTypeOrLexicalClass options: options usingBlock: ^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
            if (![tag isEqualToString:@"Adjective"]) {
                [stringWithoutAdjectives appendString: [sampleString substringWithRange: tokenRange]];
                [stringWithoutAdjectives appendString:@" "];
            }
        }];
        
        // Remove trailing space
        [stringWithoutAdjectives deleteCharactersInRange:NSMakeRange([stringWithoutAdjectives length]-1, 1)];
        
        NSLog(@"\"%@\" seems a little verbose. Try \"%@\" instead.", sampleString, stringWithoutAdjectives);
        
    }
    return 0;
}

