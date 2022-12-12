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

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Constructor params

|  Name | Description   | Required   | Default   |
| ------------ | ------------ | ------------ | ------------ |
| radius  | Double value to indicate the avatar radius. Make sure to use the same avatar radius | True   |   |
| avatar  | Widget to use as avatar, make sure to use an avatar, if not, the widget won't work |  True  |  |
| iconVisible  | Bool value to indicate when to show or hide the bottom section | False   | true |
| onIconTap  | Callback use when tap on icon | False   |   |
| icon  | Icondata to show on the bottom section | False   |  Icons.camera_alt |
| iconColor  | Color used as icon color | False   | Colors.black |
| backgroundIconColor  | Color used as background for bottom section | False   | Color.fromRGBO(0, 0, 0, 0.3) |
