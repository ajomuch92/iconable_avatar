# iconable_avatar
Flutter package to show an avatar with a clickable custom icon on the bottom. It's a customizable widget

## Instalation
Include `iconable_avatar` in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  iconable_avatar: version
```

<img src="https://raw.githubusercontent.com/ajomuch92/iconable_avatar/main/demo.png" width="200" height="429"/>

## Usage

```dart
IconableAvatar(
  avatar: CircleAvatar(
    backgroundColor: Colors.amberAccent,
    radius: 50,
  ),
  onIconTap: () {
    print('Hi :)');
  },
)
```

## Constructor params

|  Name | Description   | Required   | Default   |
| ------------ | ------------ | ------------ | ------------ |
| avatar  | Widget to use as avatar, make sure to use an avatar, if not, the widget won't work |  True  |  |
| customRadius  | Double value to indicate the avatar radius when using a not CircleAvatar widget | False   |   |
| iconVisible  | Bool value to indicate when to show or hide the bottom section | False   | true |
| onIconTap  | Callback use when tap on icon | False   |   |
| icon  | Icondata to show on the bottom section | False   |  Icons.camera_alt |
| iconColor  | Color used as icon color | False   | Colors.black |
| backgroundIconColor  | Color used as background for bottom section | False   | Color.fromRGBO(0, 0, 0, 0.3) |
