/* This file provided by Facebook is for non-commercial testing and evaluation
 * purposes only.  Facebook reserves all rights not expressly granted.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "ViewController.h"
#import "ExpandingNode.h"

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <AsyncDisplayKit/ASAssert.h>


@implementation ViewController

#pragma mark -
#pragma mark UIViewController.

- (instancetype)init
{
  if (!(self = [super initWithNode:[[ExpandingNode alloc] init]]))
    return nil;
  
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self navigationItem].rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Animate" style:UIBarButtonItemStylePlain target:self action:@selector(didTapAnimate:)];
}

- (BOOL)prefersStatusBarHidden
{
  return YES;
}

- (void)didTapAnimate:(UIBarButtonItem *)sender
{
  ExpandingNode *node = (ExpandingNode *)self.node;
  node.isExpanded = node.isExpanded ? NO : YES;
  [node setNeedsLayout];
}
                
@end
