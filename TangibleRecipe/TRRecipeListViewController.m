//
//  TRRecipeListViewController.m
//  TangibleRecipe
//

#import "TRRecipeListViewController.h"

@interface TRRecipeListViewController ()

@end

@implementation TRRecipeListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    _recipes = [[NSArray alloc] initWithObjects:@"親子丼１", @"親子丼２", nil];
    _recipeUrls = [[NSArray alloc] initWithObjects:
                   [NSURL URLWithString:@"http://cookpad.com/recipe/389822"],
                   [NSURL URLWithString:@"http://cookpad.com/recipe/2200600"],
                   nil];
    self.detailViewController = (TRRecipeDetailViewController *)[self.splitViewController.viewControllers lastObject];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                animated:NO
                          scrollPosition:UITableViewScrollPositionMiddle];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _recipes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Recipe"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Recipe"];
    }

    NSDate *object = _recipes[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"レシピ";
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSURL *recipeUrl = _recipeUrls[indexPath.row];
    self.detailViewController.url = recipeUrl;
}

- (IBAction)backToMainView:(id)sender
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    window.rootViewController = [storyBoard instantiateViewControllerWithIdentifier:@"MainViewController"];
}

@end
