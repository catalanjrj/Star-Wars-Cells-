//
//  DetailViewController.m
//  StarWarsCells
//
//  Created by Jorge Catalan on 5/4/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "DetailViewController.h"
#import "CharactersTableViewController.h"
#import "Character.h"


@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *characterName;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *characterDescription;


-(void)configureView;
@end
@implementation DetailViewController







- (void)setCharacter:(Character *)newCharacter {
    if (_character!= newCharacter) {
        _character = newCharacter;
        
        [self configureView];
    }
}

- (void)configureView
{
    if(self.character){
        self.title = self.character.name;
         self.image.image = ![self.character.image isEqualToString:@""] ? [UIImage imageNamed:self.character.image] : [UIImage imageNamed:@"no-image"];
        self.characterName.text = [NSString stringWithFormat:@" %@", self.character.name];
        self.characterDescription.text = [NSString stringWithFormat:@" %@", self.character.charDescription];
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
