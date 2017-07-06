# CPAlertViewController

A way to create a custom alert view with animation. Easy custom any other alert view base on CPAlertVC.swift and storyboard.</br><br>

<img src="https://github.com/katafo/CPAlertViewController/blob/master/screenshot.gif" />
<img src="https://github.com/katafo/CPAlertViewController/blob/master/screenshot_custom_style.png" />
</br><br>

# Usage

- Default alert

```swift

let alertVC = CPAlertVC.create().config(title: "Normal Alert", message: "Normal alert will have only one button.")
alertVC.show(into: self)

```
- Alert with action

```swift

let alertVC = CPAlertVC.create().config(title: "Action Alert", message: "You can add your action to two buttons below. By default: Cancel button will dismiss alert.")

alertVC.addAction(CPAlertAction(title: "OK", type: .normal, handler: {
    print("Tapped OK button")
}))

alertVC.addAction(CPAlertAction(title: "CANCEL", type: .cancel, handler: {
    print("Tapped Cancel button")
}))

alertVC.show(into: self)
    
```
- Alert with other animation

```swift

/** Animation Type

  .scale
  .rotate
  .bounceUp
  .bounceDown
  
  Just added animationType in CPAlertVC.show function

*/

let alertVC = CPAlertVC.create().config(title: "Rotate Animation", message: "Rotate ~90 degrees = 1.5 rad (1 rad = 57 degrees), you can change it in CPAlertVC.swift.", animationType: .rotate)
alertVC.show(into: self)

```

```swift

/** Customize style
     ________________________________
    |                    |           |
    | Properties         |  Default  |
    |____________________|___________|
    |                    |           |
    | backgroundOpacity  |    0.5    |
    | backgroundColor    |    black  |
    | animateDuration    |    0.5    |
    |                    |           |
    | scaleX             |    0.3    |
    | scaleY             |    1.5    |
    |                    |           |
    | rotateRadian       |    1.5    |
    | springWithDamping  |    0.7    |
    | delay              |    0      |
     --------------------------------
*/

let alertVC = CPAlertVC.create().config(title: "Bounce Up Animation", message: "Animating alert from bottom view to top view", animationType: .bounceUp)
alertVC.springWithDamping = 0.75
alertVC.animateDuration = 0.5
alertVC.show(into: self)

```


# Contact

- ctphong94@gmail.com

# License

`CPAlertViewController` is available under the MIT license. See the LICENSE file for more info.
