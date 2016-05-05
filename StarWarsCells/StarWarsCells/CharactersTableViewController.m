//
//  CharactersTableViewController.m
//  StarWarsCells
//
//  Created by Jorge Catalan on 5/4/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "CharactersTableViewController.h"
#import "Character.h"
#import "DetailViewController.h"

@interface CharactersTableViewController ()
@property NSMutableArray *charArray;
@property (nonatomic) Character *selectedCharacter;

-(void)loadCharacters;

@end
@implementation CharactersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Databank";
    self.charArray = [[NSMutableArray alloc] init];
    [self loadCharacters];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadCharacters{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource: @"TheForceAwakens"ofType:@"json"];
    
    NSArray *characters = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for(NSDictionary *character in characters) {
        
        [self.charArray addObject:[Character characterWithDictionary:character]];
        
        // [self.tableView reloadData];
        
    }
    [self.charArray sortUsingDescriptors:[NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES],nil]];
    
    
    [self.tableView reloadData];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.charArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"characterCell" forIndexPath:indexPath];
    
    Character *character = self.charArray[indexPath.row];
    
    
    
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = 20.0;
    cell.imageView.image = [UIImage imageNamed:character.image];
    cell.textLabel.text = character.name;

    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Deselect our row first
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //Get the selected hero
    self.selectedCharacter = self.charArray[indexPath.row];
    
    // Perform segue
    [self performSegueWithIdentifier:@"details" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"details"]) {
        [(DetailViewController *)segue.destinationViewController setCharacter:
         self.selectedCharacter];
        [self setSelectedCharacter:nil];
    
    }
}



@end





