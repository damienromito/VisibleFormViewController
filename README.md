# VisibleFormViewController
An extended UIviewController allowing to not hide the content behind the keyboard opened.

![alt text](https://github.com/damienromito/VisibleFormViewController/blob/master/picture.jpg "Explanations")

#1 - Extend your UIViewController to VisibleFormViewController

    #import "VisibleFormViewController.h"

    @interface ViewController : VisibleFormViewController


#2 - Define the last Visible View

    self.lastVisibleView = label;