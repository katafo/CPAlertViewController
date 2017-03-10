# CPAlertViewController

A way to create a custom alert view with animation. Easy custom any other alert view base on CPAlertVC.swift and storyboard.</br><br>

<img src="https://github.com/katafo/CPAlertViewController/blob/master/screenshot.gif" />
<img src="https://github.com/katafo/CPAlertViewController/blob/master/screenshot_custom_style.png" />
</br><br>

# Usage

- Default alert

```swift

var alertVC: CPAlertVC!

alertVC = CPAlertVC.show(in: self, title: "Normal Alert", message: "Normal alert will have only one button.")

```
- Alert with action

```swift

alertVC = CPAlertVC.show(in: self, title: "Action Alert", message: "You can add your action to two buttons below. By default: Cancel button will dismiss alert.")
alertVC.addAction(CPAlertAction(title: "OK", type: .normal, handler: {
    print("Tapped OK button")
}))
alertVC.addAction(CPAlertAction(title: "CANCEL", type: .cancel, handler: nil))
    
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

alertVC = CPAlertVC.show(in: self, title: "Bounce Down Animation", message: "Animating alert from top view to bottom view", animationType: .bounceDown)

```

# Contact

- ctphong94@gmail.com

# License

`CPAlertViewController` is available under the MIT license. See the LICENSE file for more info.
