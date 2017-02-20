# CPAlertViewController

A way to create a custom alert view with animation. Easy custom any other alert view base on CPAlertVC.swift and storyboard.</br><br>

<img src="https://github.com/katafo/CPAlertViewController/blob/master/screenshot.gif" />
</br><br>

# Usage

- Default alert

```swift

var alertVC: CPAlertVC!

/** Default alert */

alertVC = CPAlertVC.show(in: self, title: "Normal Alert", message: "Normal alert will have only one button.")

```
- Alert with action

```swift
/** Alert With Action

    posTitle: Title for positive button
    negTitle: Title for negative button
    posAction: Use selector to add positive action
    negAction: Use selector to add negative action
    alertType: Default is ".notice", change to ".confirm" if you want to show 2 button.
     
*/

alertVC = CPAlertVC.show(in: self, title: "Action Alert", message: "You can add your action to two buttons below. By default: Cancel button will dismiss alert.", posTitle: "OK", negTitle: "CANCEL", posAction: #selector(tapOkAction), negAction: #selector(tapCancelAction), alertType: .confirm)

//Alert action

func tapOkAction(){
        print("Tapped ok button !")
        alertVC.dismiss(animated: true, completion: nil)
    }
    
func tapCancelAction(){
    print("Tapped cancel button !")
    alertVC.dismiss(animated: true, completion: nil)
}
    
```
- Alert with other animation

```swift

/** Animation Type

  .scale
  .rotate
  .bounceUp
  .bounceDown
  
  You just add animationType in CPAlertVC.show function

*/

alertVC = CPAlertVC.show(in: self, title: "Boucne Down Animation", message: "Animating alert from top view to bottom view", animationType: .bounceDown)

```

# Contact

- ctphong94@gmail.com

# License

`CPAlertViewController` is available under the MIT license. See the LICENSE file for more info.
